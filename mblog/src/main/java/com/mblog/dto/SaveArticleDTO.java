package com.mblog.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

import static com.mblog.utils.ConstUtils.*;

@Data
public class SaveArticleDTO {

    @NotBlank(message = ARTICLE_TITLE_NOT_BLANK)
    private String title;

    private String text;

    private String intro;

    @NotBlank(message = CATEGORY_NAME_NOT_BLANK)
    private String categoryName;

    @NotBlank(message = FILEPATH_NOT_BLANK)
    private String filePath;

    private String originTitle;
}
