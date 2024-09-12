package com.mblog.controller.admin;

import com.mblog.entity.User;
import com.mblog.result.Result;
import com.mblog.service.UserService;
import com.mblog.utils.JWTUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import static com.mblog.utils.ConstUtils.JWT_AUTHENTICATION_FAIL;

@RestController("loginController")
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody User user){
        log.info("登录：{}",user);
        String encodePassword = DigestUtils.md5DigestAsHex((user.getName()+user.getPassword()).getBytes());
        user.setPassword(encodePassword);
        User user1 = userService.login(user);
        if(user1 != null){
            String token = JWTUtil.token(user1.getId(),user1.getName(),user1.getPermission());
            user1.setToken(token);
            return Result.success(user1);
        }else{
            return Result.error(JWT_AUTHENTICATION_FAIL);
        }
    }

    @GetMapping("/auth")
    public Result getUser(HttpServletRequest request){
        String token = request.getHeader("authorization");
        log.info("token验证有效性:{}",token);
        boolean verify = JWTUtil.verify(token);
        if(verify){
            return Result.success();
        }else {
            return Result.error(JWT_AUTHENTICATION_FAIL);
        }
    }
    @PostMapping("/test")
    public String test(String token){
        log.info("当前token为：[{}]",token);
        boolean verify = JWTUtil.verify(token);
        if (verify){
            return "success";
        }
        return "false";
    }
}
