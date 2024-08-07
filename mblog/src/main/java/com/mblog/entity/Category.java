package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    //分类唯一ID
    private Integer id;
    //分类名称
    private String name;
    //分类父ID
    private Integer parentId;
    //分类层级
    private Integer level;
    //此分类的文章数
    private Integer number;
}
