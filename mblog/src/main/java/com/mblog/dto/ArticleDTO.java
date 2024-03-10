package com.mblog.dto;

import lombok.Data;

@Data
public class ArticleDTO {
    private Integer id;
    private String title;
    private String intro;
    private String categoryName;
    private String filePath;
}
