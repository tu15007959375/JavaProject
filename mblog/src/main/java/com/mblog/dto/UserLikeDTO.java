package com.mblog.dto;

import lombok.Data;

@Data
public class UserLikeDTO {
    //浏览器唯一Id
    private String browserId;
    //文章名称
    private String articleTitle;
    private int likeflag;
    private int loveflag;
    private int smileflag;
}
