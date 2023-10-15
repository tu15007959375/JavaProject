package com.xxx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class Test08CacheApplication {

    public static void main(String[] args) {
        SpringApplication.run(Test08CacheApplication.class, args);
    }

}
