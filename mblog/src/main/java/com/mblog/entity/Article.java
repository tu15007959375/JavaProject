package com.mblog.entity;

import com.mysql.cj.xdevapi.JsonArray;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Article {
    //文章唯一Id
    private Integer id;
    //文章名称和文件名
    private String title;
    //文章简介
    private String intro;
    //文章创建时间
    private LocalDateTime createTime;
    //文章修改时间
    private LocalDateTime updateTime;
    //文章属于的分类id
    private Integer categoryId;
    //文章属于的名称
    private String categoryName;
    //文章访问量
    private Long pageView;
}
