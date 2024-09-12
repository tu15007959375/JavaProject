package com.mblog;

import com.mblog.service.CategoryService;
import com.mblog.tasks.CreateMonthGrowthTask;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@Slf4j
@EnableCaching//开启缓存注解功能
@EnableScheduling
@MapperScan("com.mblog.mapper")
public class MblogApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(MblogApplication.class, args);
        CreateMonthGrowthTask createMonthGrowthTask =applicationContext.getBean(CreateMonthGrowthTask.class);
        CategoryService categoryService = applicationContext.getBean(CategoryService.class);
        createMonthGrowthTask.insertMonthGrowth();
        categoryService.init();
    }

}
