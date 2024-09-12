package com.mblog.service;

import com.mblog.entity.User;

public interface UserService {

    /**
     * 用户登录
     * @param user
     * @return
     */
    User login(User user);
}
