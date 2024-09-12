package com.mblog.controller.admin;

import com.mblog.annotation.Log;
import com.mblog.entity.Category;
import com.mblog.enums.BusinessType;
import com.mblog.result.Result;
import com.mblog.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import java.util.List;


@RestController("adminCategoryController")
@RequestMapping("/admin/category")
@Slf4j
@Validated
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
    @Log(operation = "根据id修改分类信息",businessType = BusinessType.UPDATE)
    @PutMapping
    public Result update(@RequestBody @Validated Category category){
        log.info("修改分类:{}",category);
        categoryService.update(category);
        return Result.success();
    }

    /**
     * 根据id删除分类
     * @param id
     * @return
     */
    @Log(operation = "根据id删除分类",businessType = BusinessType.DELETE)
    @DeleteMapping
    public Result deleteByID(@RequestParam @Min(1)Integer id){
        log.info("删除分类:{}",id);
        categoryService.deleteById(id);
        return Result.success();
    }

    /**
     * 添加分类
     * @param category
     * @return
     */
    @Log(operation = "新增分类",businessType = BusinessType.INSERT)
    @PostMapping
    public Result save(@RequestBody @Validated Category category){
        log.info("添加分类:{}",category);
        categoryService.save(category);
        return Result.success();
    }


}
