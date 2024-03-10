package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserLike {
    //浏览器唯一Id
    private String browserId;
    //文章id
    private int articleId;
    private int likeflag;
    private int loveflag;
    private int smileflag;
}
