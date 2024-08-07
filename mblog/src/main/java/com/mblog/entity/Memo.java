package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Memo implements Serializable {
    //备忘录实体类
    private Integer id;
    private String name;
    private Integer tag;//标志位，0最重要
    private LocalDateTime createTime;
    private LocalDateTime date;
    private Integer status;//是否完成，1代表完成
}
