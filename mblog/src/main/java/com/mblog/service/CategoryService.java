package com.mblog.service;

import com.mblog.entity.Category;
import com.mblog.vo.CategoryVO;

import java.util.List;

public interface CategoryService {

    /**
     * 获取全部分类信息
     * @return
     */
    List<Category> getAllCategories();

    /**
     * 返回多级分类嵌套列表
     * @return
     */
    List<CategoryVO> init();

    /**
     * 获取所有分类名
     * @return
     */
    List<String> getAllNames();

    /**
     * 根据id修改分类信息
     * @param category
     * @return
     */
    void update(Category category);
    /**
     * 根据id删除分类
     * @param id
     * @return
     */
    void deleteById(Integer id);

    /**
     * 添加分类
     * @param category
     * @return
     */
    void save(Category category);
}
