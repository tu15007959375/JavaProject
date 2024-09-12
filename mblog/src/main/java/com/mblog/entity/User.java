package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class User {
    private Integer id;//用户id
    private String name;//用户名
    private String password;//用户密码
    private Integer permission;//用户权限等级
    private String token;
}
