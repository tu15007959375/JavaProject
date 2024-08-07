package com.mblog.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserLikeVO {

    //文章名称
    private String articleTitle;
    private int likeflag;
    private int loveflag;
    private int smileflag;

    //文章简介
    private String intro;
    //文章创建时间
    private LocalDateTime createTime;
    //文章分类id
    private int categoryId;
    //文章属于的名称
    private String categoryName;
    //文章访问量
    private Long pageView;
}
