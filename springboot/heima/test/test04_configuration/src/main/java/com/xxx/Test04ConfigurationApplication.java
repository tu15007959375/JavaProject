package com.xxx;

import com.alibaba.druid.pool.DruidDataSource;
import com.xxx.config.ServerConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Test04ConfigurationApplication {

	@Bean
	@ConfigurationProperties(prefix = "datasource")
	public DruidDataSource dataSource(){
		DruidDataSource ds = new DruidDataSource();
		return ds;
	}
	public static void main(String[] args) {
		ConfigurableApplicationContext ca = SpringApplication.run(Test04ConfigurationApplication.class, args);
		ServerConfig bean = ca.getBean(ServerConfig.class);
		System.out.println(bean);
		DruidDataSource bean1 = ca.getBean(DruidDataSource.class);
		System.out.println(bean1.getDriverClassName());

	}

}
