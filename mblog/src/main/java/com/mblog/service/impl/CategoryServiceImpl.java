package com.mblog.service.impl;

import com.mblog.entity.Category;
import com.mblog.mapper.CategoryMapper;
import com.mblog.service.CategoryService;
import com.mblog.vo.CategoryVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@Slf4j
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    /**
     * 获取全部分类信息
     * @return
     */
    public List<Category> getAllCategories() {
        List<Category> categoryList = categoryMapper.getAll();
        return categoryList;
    }

    /**
     * 返回多级分类嵌套列表
     * @return
     */
    public List<CategoryVo> init() {
        List<Category> categories = categoryMapper.getAll();
        List<CategoryVo> categoryVoList = new ArrayList<>();
        int maxLevel = 0;
        for(int i = 0; i<categories.size(); i++){
            Category category = categories.get(i);
            CategoryVo categoryVo = new CategoryVo();
            if(category.getParentId() == -1){
                BeanUtils.copyProperties(category,categoryVo);
                categoryVoList.add(categoryVo);
//                categoryVo.setNumber(0);
            }
            if(category.getLevel()>maxLevel){
                maxLevel = category.getLevel();
            }
        }
        findSubCategory(categories,categoryVoList);

        for (int i = 0;i <categoryVoList.size();i++){
            int count  = countAllNumber(categoryVoList.get(i));
            categoryVoList.get(i).setNumber(count);
        }
        return categoryVoList;
    }
    /**
     * 获取所有分类名
     * @return
     */
    public List<String> getAllNames() {
        return categoryMapper.getAllNames();
    }
    /**
     * 根据id修改分类信息
     * @param category
     * @return
     */
    public void update(Category category) {
        categoryMapper.update(category);
    }
    /**
     * 根据id删除分类
     * @param id
     * @return
     */
    public void deleteById(Integer id) {
        categoryMapper.deleteById(id);
    }
    /**
     * 添加分类
     * @param category
     * @return
     */
    public void save(Category category) {
        categoryMapper.save(category);
    }

    private static int countAllNumber(CategoryVo categoryVo) {
        if (categoryVo.getChildren().isEmpty()) {
            return categoryVo.getNumber();
        }
        int count = 0;
        for (CategoryVo child : categoryVo.getChildren()) {
            count += countAllNumber(child);
        }
        categoryVo.setNumber(count);
        return count;
    }
    private void findSubCategory(List<Category> categories, List<CategoryVo> categoryVoList) {
        // 遍历一级
        for (CategoryVo categoryVo : categoryVoList) {
            List<CategoryVo> curVoList = new ArrayList<>();
            categoryVo.setNumber(categoryMapper.getNumberByCategoryId(categoryVo.getId()));
            // 查找子级
            for (Category category : categories) {
                // 判断当前目录是否是子父级关系
                if (categoryVo.getId().equals(category.getParentId())) {
                    CategoryVo temp = new CategoryVo();
                    BeanUtils.copyProperties(category,temp);
                    temp.setNumber(categoryMapper.getNumberByCategoryId(category.getId()));
                    curVoList.add(temp);
                }
                // 递归调用，不管有几级菜单，都能够适用
                findSubCategory(categories, curVoList);

            }
            // 最后把查到的子级保存到一级目录中
            categoryVo.setChildren(curVoList);
        }
    }
}
