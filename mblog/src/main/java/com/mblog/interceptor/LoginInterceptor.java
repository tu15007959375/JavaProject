package com.mblog.interceptor;

import com.mblog.utils.JWTUtil;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 *
 * */
public class LoginInterceptor implements HandlerInterceptor {
    //预处理-->进入到控制器之前
    //返回false 不进入处理器，返回true，就进入拦截器中执行
    //在控制器之前走这个，决定是否走这个控制器
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //在请求头中取到token令牌;
        String token = request.getHeader("Authorization");
        //验证token;
        boolean b = JWTUtil.verify(token);
        //若令牌不符合则响应信息为 401;
        if(!b){
            response.getWriter().print(401);
        }
        return b;
    }
}

