package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysOperLog {


    private Long id;

    private String operation;

    private String businessType;

    private String method;

    private LocalDateTime createTime;

//    private String operName;

    private String params;

    private String ip;

    public SysOperLog(String operation, String method, LocalDateTime createTime, String ip) {
        this.operation = operation;
        this.method = method;
        this.createTime = createTime;
        this.ip = ip;
        this.businessType = "unknown";
        this.params = "unknown";
    }
}