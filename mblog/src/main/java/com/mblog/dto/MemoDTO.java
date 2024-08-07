package com.mblog.dto;

import lombok.Data;

@Data
public class MemoDTO {
    private Integer id;
    private String name;
    private String date;
    private Integer tag;
    private Integer status;
}
