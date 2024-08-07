package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ArticleLike {

    //文章id
    private int articleId;
    //文章名称
    private String articleTitle;
    private int likeNum;
    private int loveNum;
    private int smileNum;
}
