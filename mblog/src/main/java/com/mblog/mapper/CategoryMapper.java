package com.mblog.mapper;

import com.mblog.entity.Category;
import com.mblog.vo.CategoryVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CategoryMapper {

    /**
     * 查询全部分页信息
     * @return
     */
    @Select("select * from categories")
    List<Category> getAll();

    /**
     * 根据分类id获取文章数量
     * @param id
     * @return
     */
    @Select("select count(*) from article where categoryId=#{id}")
    Integer getNumberByCategoryId(Integer id);

    @Select("select id from categories where name = #{categoryName}")
    int getIdByName(String categoryName);

    /**
     * 根据parentId获取分类列表
     * @param rootId
     * @return
     */
    @Select("select * from categories where parentId = #{rootId}")
    List<Category> getCategoryListByParentId(int rootId);
    /**
     * 获取所有分类名
     * @return
     */
    @Select("select name from categories")
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
    @Delete("delete from categories where id = #{id};")
    void deleteById(Integer id);

    /**
     * 添加分类
     * @param category
     * @return
     */
    @Insert("insert categories(name, parentId, level) VALUES (#{name},#{parentId},#{level})")
    void save(Category category);
}
