package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

import static com.mblog.utils.ConstUtils.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    //分类唯一ID
    private Integer id;
    //分类名称
    @NotBlank(message = CATEGORY_NAME_NOT_BLANK)
    private String name;
    //分类父ID
    @NotBlank(message = ID_NOT_NULL)
    private Integer parentId;
    //分类层级
    @NotBlank(message = CATEGORY_LEVEL_NOT_BLANK)
    private Integer level;
    //此分类的文章数
    private Integer number;
}
