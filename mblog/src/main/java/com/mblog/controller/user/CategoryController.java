package com.mblog.controller.user;

import com.mblog.entity.Category;
import com.mblog.result.Result;
import com.mblog.service.CategoryService;
import com.mblog.vo.CategoryVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("userCategoryController")
@RequestMapping("/user/category")
@Slf4j
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 获取所有分类名
     * @return
     */
    @GetMapping("/getAllNames")
    public Result<List<String>> getAllNames(){
        log.info("获取所有分类名");
        List<String> categoryNameList = categoryService.getAllNames();
        return Result.success(categoryNameList);
    }
    /**
     * 查询所有分类
     * @return
     */
    @GetMapping("/list")
    public Result<List<Category>> getAllCategories(){
        List<Category> categoryList = categoryService.getAllCategories();
        return Result.success(categoryList);
    }

    /**
     * 返回多级分类嵌套列表
     * @return
     */
    @GetMapping("/init")
    public Result<List<CategoryVO>> init(){
        List<CategoryVO> categoryVOList = categoryService.init();
        return Result.success(categoryVOList);
    }
}

