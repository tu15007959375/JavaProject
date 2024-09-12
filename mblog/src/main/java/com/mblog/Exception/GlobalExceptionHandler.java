package com.mblog.Exception;

import com.mblog.entity.SysOperLog;
import com.mblog.mapper.SysOperLogMapper;
import com.mblog.result.Result;
import com.mblog.utils.IpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;
import java.time.LocalDateTime;

import static com.mblog.utils.ConstUtils.*;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @Autowired
    SysOperLogMapper sysOperLogMapper;

    @Autowired
    HttpServletRequest request;


    @ExceptionHandler({BindException.class, ConstraintViolationException.class})
    public Result exceptionHandler(Exception e) {
        return printErrorAndSave(e.getMessage(),PARAM_AUTHENTICATION_EXCEPTION);
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    public Result exceptionHandler(MissingServletRequestParameterException e) {
        return printErrorAndSave(e.getMessage(),PARAM_ERROR_EXCEPTION);
    }
    @ExceptionHandler(NumberFormatException.class)
    public Result exceptionHandler(NumberFormatException e) {
        return printErrorAndSave(e.getMessage(),TYPE_CONVERT_EXCEPTION);
    }
    @ExceptionHandler(Exception.class)
    public Result unknownExceptionHandler(Exception e) {
        return printErrorAndSave(e.getMessage(),UNKNOWN_EXCEPTION);
    }

    public Result printErrorAndSave(String failMsg, String exception){
        log.error("{}:{}", exception, failMsg);
        SysOperLog sysOperLog = new SysOperLog(failMsg,request.getRequestURI(), LocalDateTime.now(), IpUtil.getIpAddress(request));
        sysOperLogMapper.insert(sysOperLog);
        return Result.error(exception);
    }
}
