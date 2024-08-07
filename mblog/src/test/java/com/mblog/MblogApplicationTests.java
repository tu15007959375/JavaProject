package com.mblog;

import com.mblog.entity.Article;
import com.mblog.entity.Category;
import com.mblog.entity.Memo;
import com.mblog.service.ArticleService;
import com.mblog.service.CategoryService;
import com.mblog.service.MemoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class MblogApplicationTests {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private MemoService memoService;
    @Test
    void test() {
        List<Category> categoryList = categoryService.getAllCategories();
        for (Category category : categoryList) {
            System.out.println(category);
        }
    }

    @Test
    void test2(){
        List<Memo> memoListByTime = memoService.getMemoListByTime("2023-12-06");
        System.out.println(memoListByTime);
    }

}
