package com.qhu;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

//封装yaml文件数据
@Component
@ConfigurationProperties(prefix = "datasouce")
public class Readdata {
    private String driver;
    private String username;

    @Override
    public String toString() {
        return "Readdata{" +
                "driver='" + driver + '\'' +
                ", username='" + username + '\'' +
                '}';
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
