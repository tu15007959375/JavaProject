package com.mblog.service.impl;

import com.mblog.entity.User;
import com.mblog.mapper.UserMapper;
import com.mblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;
    /**
     * 用户登录
     * @param user
     * @return
     */
    public User login(User user) {
        return userMapper.login(user);
    }
}
