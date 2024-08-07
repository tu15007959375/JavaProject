package com.mblog.mapper;

import com.mblog.entity.SysOperLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.*;
@Mapper
public interface SysOperLogMapper {

    @Insert("insert into sys_oper_log(operation, business_type, method, create_time,  params, ip) VALUES (#{operation},#{businessType},#{method},#{createTime},#{params},#{ip})")
//    @Select("select * from sys_oper_log;")
    void insert(SysOperLog sysOperLog);
}
