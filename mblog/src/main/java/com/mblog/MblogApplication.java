package com.mblog;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@Slf4j
@EnableCaching//开启缓存注解功能
@MapperScan("com.mblog.mapper")
public class MblogApplication {

    public static void main(String[] args) {
        SpringApplication.run(MblogApplication.class, args);
    }

}
