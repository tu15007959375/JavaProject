package com.mblog.controller.user;

import com.mblog.annotation.Log;
import com.mblog.dto.UserLikeDTO;
import com.mblog.entity.Article;
import com.mblog.entity.ArticleLike;
import com.mblog.enums.BusinessType;
import com.mblog.result.PageResult;
import com.mblog.result.Result;
import com.mblog.service.ArticleService;
import com.mblog.vo.BaseInfoVO;
import com.mblog.vo.UserLikeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;

import static com.mblog.utils.ConstUtils.ARTICLE_TITLE_NOT_BLANK;

@RestController("userArticleController")
@RequestMapping("/user/article")
@Slf4j
@Validated
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * 根据分类名称和每页大小以及第几页获取文章信息
     * @return
     */
    @GetMapping({"/list/{categoryName}","/list"})
    public Result<PageResult> getArticlesByCategoryNameAndPage(@PathVariable(required = false) String categoryName, @RequestParam Integer pageSize, @RequestParam Integer currentPage, @RequestParam Integer order,@RequestParam String searchValue){
        log.info("根据分类名称和每页大小以及第几页获取文章信息,排序:{},{},{},{},搜索值:{}",categoryName,pageSize,currentPage,order,searchValue);
        PageResult pageResult  = articleService.getArticlesByCategoryNameAndPage(categoryName,pageSize,currentPage,order,searchValue);
        return Result.success(pageResult);
    }

    /**
     * 根据title获取文章信息
     * @param articleTitle
     * @return
     */
    @GetMapping("/title/{articleTitle}")
    public Result<Article> getArticleByTitle(@PathVariable @NotBlank(message = ARTICLE_TITLE_NOT_BLANK) String articleTitle){
        log.info("根据title获取文章信息:{}",articleTitle);
        Article article = articleService.getArticleByTitle(articleTitle);
        return Result.success(article);
    }

    /**
     * 根据开始和结束时间获取区域内的每周文章数量
     * @param beginTime
     * @param endTime
     * @return
     */
    @GetMapping("/dateList")
    public Result<List<Integer>> getEveryMonthCountsByTime(@RequestParam String beginTime, @RequestParam String endTime){
        log.info("根据开始和结束时间获取区域内的每月文章数量:{},{}",beginTime,endTime);
        List<Integer> countsList = articleService.getEveryMonthCountsByTime(beginTime,endTime);
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

    /**
     * 获取后台管理系统基本信息
     * @return
     */
    @GetMapping("/baseInfo")
    public Result<BaseInfoVO> getBaseInfo(){
        log.info("获取后台管理系统基本信息");
        BaseInfoVO baseInfoVO = articleService.getBaseInfo();
        return Result.success(baseInfoVO);
    }
}
