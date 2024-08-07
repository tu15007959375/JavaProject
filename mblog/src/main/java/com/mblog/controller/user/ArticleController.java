package com.mblog.controller.user;

import com.mblog.annotation.Log;
import com.mblog.dto.UserLikeDTO;
import com.mblog.entity.Article;
import com.mblog.entity.ArticleLike;
import com.mblog.enums.BusinessType;
import com.mblog.result.PageResult;
import com.mblog.result.Result;
import com.mblog.service.ArticleService;
import com.mblog.vo.UserLikeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("userArticleController")
@RequestMapping("/user/article")
@Slf4j
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * 根据分类名称和每页大小以及第几页获取文章信息
     * @return
     */
    @GetMapping({"/list/{categoryName}","/list"})
    public Result<PageResult> getArticlesByCategoryNameAndPage(@PathVariable(required = false) String categoryName, @RequestParam Integer pageSize, @RequestParam Integer currentPage, @RequestParam Integer order ){
        log.info("根据分类名称和每页大小以及第几页获取文章信息,排序:{},{},{},{}",categoryName,pageSize,currentPage,order);
        PageResult pageResult  = articleService.getArticlesByCategoryNameAndPage(categoryName,pageSize,currentPage,order);
        return Result.success(pageResult);
    }

    /**
     * 根据搜索内容获取文章信息
     * @param searchValue
     * @return
     */
    @GetMapping("/search/{searchValue}")
    public Result<PageResult> getArticlesBySearch(@PathVariable String searchValue,@RequestParam Integer pageSize,@RequestParam Integer currentPage){
        log.info("搜索：{},{},{}",searchValue,pageSize,currentPage);
        PageResult pageResult = articleService.getArticlesBySearch(searchValue,pageSize,currentPage);
        return Result.success(pageResult);
    }

    /**
     * 根据title获取文章信息
     * @param articleTitle
     * @return
     */
    @GetMapping("/title/{articleTitle}")
    public Result<Article> getArticleByTitle(@PathVariable String articleTitle){
        log.info("根据title获取文章信息:{}",articleTitle);
        Article article = articleService.getArticleByTitle(articleTitle);
        return Result.success(article);
    }

    /**
     * 根据开始和结束时间获取区域内的每天文章数量
     * @param beginTime
     * @param endTime
     * @return
     */
    @GetMapping("/date")
    public Result<List<Integer>> getEverydayCountsByTime(@RequestParam String beginTime,@RequestParam String endTime){
        log.info("根据开始和结束时间获取区域内的每天文章数量:{},{}",beginTime,endTime);
        List<Integer> countsList = articleService.getEverydayCountsByTime(beginTime,endTime);
        return Result.success(countsList);
    }

    /**
     * 获取文章的点赞相关信息
     * @param articleTitle
     * @return
     */
    @GetMapping("/articleLike/{articleTitle}")
    public Result<ArticleLike> getArticleLike(@PathVariable String articleTitle){
        log.info("获取文章的点赞相关信息：{}",articleTitle);
        ArticleLike articleLike = articleService.getArticleLike(articleTitle);
        return Result.success(articleLike);
    }

    /**
     * 获取用户的点赞相关信息和文章信息
     * @param userLikeDTO
     * @return
     */
    @PostMapping("/userLike")
    public Result<UserLikeVO> getUserLike(@RequestBody UserLikeDTO userLikeDTO){
        log.info("获取用户的点赞相关信息和文章信息：{}",userLikeDTO);
        UserLikeVO userLikeVO = articleService.getUserLike(userLikeDTO);
        return Result.success(userLikeVO);
    }

    /**
     * 更新文章和用户点赞信息
     * @param userLikeDTO
     * @return
     */
    @Log(operation = "更新文章和用户点赞信息",businessType = BusinessType.UPDATE)
    @PutMapping
    public Result updateLike(@RequestBody UserLikeDTO userLikeDTO){
        log.info("更新文章和用户点赞信息：{}",userLikeDTO);
        articleService.updateLike(userLikeDTO);
        return Result.success();
    }
}
