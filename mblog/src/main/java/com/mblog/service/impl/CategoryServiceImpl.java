package com.mblog.service.impl;

import com.mblog.entity.Category;
import com.mblog.mapper.CategoryMapper;
import com.mblog.service.CategoryService;
import com.mblog.vo.CategoryVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private RedisTemplate<Object,Object> redisTemplate;


    private List<Integer> rootCategoryIds = new ArrayList<>();
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
    public List<CategoryVO> init() {
        ValueOperations<Object, Object> opsForValue = redisTemplate.opsForValue();
        List<Integer> getFromSqlIds = new ArrayList<>();
        List<CategoryVO> categoryVORedisList = new ArrayList<>();
        int tag = 0;//用于判断redis中是否存在分类id列表,0不存在，1存在
        //redis中存在数据
        if(Boolean.TRUE.equals(redisTemplate.hasKey("categoryIds"))){
            tag = 1;

            List<Integer> categoryIds = (List<Integer>) opsForValue.get("categoryIds");
            if (categoryIds != null) {
                for (Integer categoryId : categoryIds) {
                    if(Boolean.TRUE.equals(redisTemplate.hasKey("category"+categoryId))){
                        categoryVORedisList.add((CategoryVO)opsForValue.get("category"+categoryId));
                    }else {
                        getFromSqlIds.add(categoryId);
                    }

                }
            }else{
                System.out.println("redis中分类id为空");
            }
        }
        if(tag == 1 && getFromSqlIds.isEmpty()){
            System.out.println("不需要从数据库获取数据");
            return categoryVORedisList;
        }
        List<CategoryVO> categoryVOList = new ArrayList<>();
        List<Category> categories = categoryMapper.getAll();

        for (Category category : categories) {
            CategoryVO categoryVo = new CategoryVO();
            BeanUtils.copyProperties(category, categoryVo);
            if(tag == 1){
                if(getFromSqlIds.contains(category.getId())){
                    categoryVOList.add(categoryVo);
                }
            }else{
                if (category.getParentId() == -1 ) {

                    categoryVOList.add(categoryVo);
                }
            }

        }
        if(tag == 0){
            List<Integer> categoryIds = categoryVOList.stream().map(CategoryVO::getId).collect(Collectors.toList());
            opsForValue.set("categoryIds",categoryIds);
        }
        findSubCategory(categories, categoryVOList);

        for (int i = 0; i < categoryVOList.size(); i++){
            System.out.println("从数据库获取分类id:name->"+ categoryVOList.get(i).getId()+":"+ categoryVOList.get(i).getName());
            opsForValue.set("category"+ categoryVOList.get(i).getId(), categoryVOList.get(i));
        }
        categoryVORedisList.addAll(categoryVOList);
        return categoryVORedisList;
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
        //旧的分类
        int rootId = getRootCategoryId(category.getId());
        for (int i = 1; i < rootCategoryIds.size(); i++){
            categoryMapper.delNumberByCategoryId(category.getNumber(),rootCategoryIds.get(i));
        }
        redisTemplate.delete("category" + rootId);

        //新分类
        categoryMapper.update(category);
        int newRootId = getRootCategoryId(category.getId());
        for (int i = 1; i < rootCategoryIds.size(); i++){
            categoryMapper.addNumberByCategoryId(category.getNumber(),rootCategoryIds.get(i));
        }
        redisTemplate.delete("category" + newRootId);
    }
    /**
     * 根据id删除分类
     * @param id
     * @return
     */
    public void deleteById(Integer id) {
        int rootId = getRootCategoryId(id);
        redisTemplate.delete("category" + rootId);
        categoryMapper.deleteById(id);
    }
    /**
     * 添加分类
     * @param category
     * @return
     */
    public void save(Category category) {
        category.setNumber(0);
        categoryMapper.save(category);
        int rootId = getRootCategoryId(categoryMapper.getIdByName(category.getName()));
        redisTemplate.delete("category" + rootId);
    }

    private static int countAllNumber(CategoryVO categoryVo) {
        if (categoryVo.getChildren().isEmpty()) {
            return categoryVo.getNumber();
        }
        int count = 0;
        for (CategoryVO child : categoryVo.getChildren()) {
            count += countAllNumber(child);
        }
        categoryVo.setNumber(count);
        return count;
    }
    private void findSubCategory(List<Category> categories, List<CategoryVO> categoryVOList) {
        // 遍历一级
        for (CategoryVO categoryVo : categoryVOList) {
            List<CategoryVO> curVoList = new ArrayList<>();
            // 查找子级
            for (Category category : categories) {
                // 判断当前目录是否是子父级关系
                if (categoryVo.getId().equals(category.getParentId())) {
                    CategoryVO temp = new CategoryVO();
                    BeanUtils.copyProperties(category,temp);
                    curVoList.add(temp);
                }
                // 递归调用，不管有几级菜单，都能够适用
                findSubCategory(categories, curVoList);
            }
            // 最后把查到的子级保存到一级目录中
            categoryVo.setChildren(curVoList);
        }
    }
    public int getRootCategoryId(int curId){
        rootCategoryIds.clear();
        Category category = new Category();
        rootCategoryIds.add(curId);
        while (curId != -1){
            category = categoryMapper.getCategoryById(curId);
            curId = category.getParentId();
            rootCategoryIds.add(curId);
        }
        return category.getId();
    }
}
