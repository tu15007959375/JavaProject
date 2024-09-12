package com.mblog.mapper;

import com.mblog.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select("select * from user where name = #{name} and password = #{password}")
    public User login(User user) ;
}
