package com.mblog.dto;

import lombok.Data;

@Data
public class SaveArticleDTO {
    private String title;
    private String text;
    private String intro;
    private String categoryName;
    private String filePath;
    private String originTitle;
}
