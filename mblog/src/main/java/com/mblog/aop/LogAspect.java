package com.mblog.aop;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mblog.annotation.Log;
import com.mblog.entity.SysOperLog;
import com.mblog.mapper.SysOperLogMapper;
import com.mblog.utils.IpUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;

@Aspect
@Component
public class LogAspect {
    @Pointcut("@annotation(com.mblog.annotation.Log)")
    public void pointCut(){}

    @Autowired
    HttpServletRequest request;
    @Autowired
    SysOperLogMapper sysOperLogMapper;

    @After(value = "pointCut()")
    public void afterLogWrite(JoinPoint joinPoint){
        // 创建日志对象
        SysOperLog sysOperLog = new SysOperLog();
        // 获取我们调用的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        // 获取方法上的Log注解，因为我们要获取注解中的一些信息
        Log log = method.getAnnotation(Log.class);

        // 获取我们调用的类的名称
        String className = joinPoint.getTarget().getClass().getName();
        // 获取调用的方法的名称
        String methodName = method.getName();
        // 重新修改一下我们调用的方法 是全路径的
        methodName = className + methodName;

        // 获取方法的参数
        Object[] args = joinPoint.getArgs();
        ObjectMapper objectMapper = new ObjectMapper();
        String params = "";
        try {
            params =  objectMapper.writeValueAsString(args);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        // 获取注解中的操作名称
        String operation = log.operation();
        // 获取注解中的操作类型
        String businessType = log.businessType().toString();

        // 这里的操作人员仅靠后端是写不了的  需要前端的token认证  我直接把操作人员改为admin
//        String username = "req";

        // 获取ip地址
        String ipAddress = IpUtil.getIpAddress(request);

        sysOperLog.setBusinessType(businessType);
        sysOperLog.setOperation(operation);
        sysOperLog.setMethod(methodName);
        sysOperLog.setParams(params);
        sysOperLog.setIp(ipAddress);
//        sysOperLog.setOperName(username);
        sysOperLog.setCreateTime(LocalDateTime.now());

        sysOperLogMapper.insert(sysOperLog);

    }
}