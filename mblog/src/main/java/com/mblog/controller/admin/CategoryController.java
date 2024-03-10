package com.mblog.controller.admin;

import com.mblog.entity.Category;
import com.mblog.result.Result;
import com.mblog.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController("adminCategoryController")
@RequestMapping("/admin/category")
@Slf4j
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/list")
    public Result<List<Category>> getAllCategory(){
        log.info("获取全部分类");
        List<Category> categoryList = categoryService.getAllCategories();
        return Result.success(categoryList);
    }

    /**
     * 根据id修改分类信息
     * @param category
     * @return
     */
    @PutMapping
    @CacheEvict(value = "categoryCache",key = "'categoryCache'")
    public Result update(@RequestBody Category category){
        log.info("修改分类:{}",category);
        categoryService.update(category);
        return Result.success();
    }

    /**
     * 根据id删除分类
     * @param id
     * @return
     */
    @DeleteMapping
    @CacheEvict(value = "categoryCache",key = "'categoryCache'")
    public Result deleteByID(@RequestParam Integer id){
        log.info("删除分类:{}",id);
        categoryService.deleteById(id);
        return Result.success();
    }

    /**
     * 添加分类
     * @param category
     * @return
     */
    @PostMapping
    @CacheEvict(value = "categoryCache",key = "'categoryCache'")
    public Result save(@RequestBody Category category){
        log.info("添加分类:{}",category);
        categoryService.save(category);
        return Result.success();
    }

}
