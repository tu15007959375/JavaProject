package com.mblog.service;

import com.mblog.dto.SaveArticleDTO;
import com.mblog.dto.UserLikeDTO;
import com.mblog.entity.Article;
import com.mblog.entity.ArticleLike;
import com.mblog.result.PageResult;
import com.mblog.vo.BaseInfoVO;
import com.mblog.vo.UserLikeVO;

import java.util.List;

public interface ArticleService {

    /**
     * 根据分类名称和每页大小以及第几页获取文章信息
     * @return
     */
    PageResult getArticlesByCategoryNameAndPage(String categoryName, Integer pageSize, Integer currentPage,Integer order,String searchValue);


    /**
     * 删除指定id的文章，数据库和文件夹中同时删除
     * @param id
     * @param filePath
     * @return
     */
    void deleteById(Integer id, String filePath);

    /**
     * 根据id获取文章名
     * @param id
     * @return
     */
    String getArticleTitleById(Integer id);
    /**
     * 根据id更新文章信息
     * @param saveArticleDTO
     * @return
     */
    void update(SaveArticleDTO saveArticleDTO);

    /**
     * 新增md文件
     * @param saveArticleDTO
     * @return
     */
    void save(SaveArticleDTO saveArticleDTO);

    /**
     * 根据title获取文章信息
     * @param articleTitle
     * @return
     */
    Article getArticleByTitle(String articleTitle);

    /**
     * 根据开始和结束时间获取区域内的每天文章数量
     * @param beginTime
     * @param endTime
     * @return
     */
    List<Integer> getEveryMonthCountsByTime(String beginTime, String endTime);

    /**
     * 获取文章的点赞相关信息
     * @param articleTitle
     * @return
     */
    ArticleLike getArticleLike(String articleTitle);
    /**
     * 更新文章和用户点赞信息
     * @param userLikeDTO
     * @return
     */
    void updateLike(UserLikeDTO userLikeDTO);

    /**
     * 获取用户的点赞相关信息
     * @param userLikeDTO
     * @return
     */
    UserLikeVO getUserLike(UserLikeDTO userLikeDTO);

    /**
     * 获取后台管理系统基本信息
     * @return
     */
    BaseInfoVO getBaseInfo();
}
