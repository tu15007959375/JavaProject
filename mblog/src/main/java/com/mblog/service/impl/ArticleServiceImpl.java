package com.mblog.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mblog.dto.ArticleDTO;
import com.mblog.dto.SaveArticleDTO;
import com.mblog.dto.UserLikeDTO;
import com.mblog.entity.Article;
import com.mblog.entity.ArticleLike;
import com.mblog.entity.Category;
import com.mblog.entity.UserLike;
import com.mblog.mapper.ArticleMapper;
import com.mblog.mapper.CategoryMapper;
import com.mblog.result.PageResult;
import com.mblog.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    /**
     * 根据分类名称和每页大小以及第几页获取文章信息
     * @return
     */
    public PageResult getArticlesByCategoryNameAndPage(String categoryName, Integer pageSize, Integer currentPage) {
        PageHelper.startPage(1,5);
        if(currentPage != null && pageSize != null){
            PageHelper.startPage(currentPage,pageSize);
        }
        Page<Article> page = articleMapper.getArticlesByCategoryNameAndPage(categoryName,pageSize,currentPage);
        if(categoryName == "" || categoryName == null)
            return new PageResult(page.getTotal(),page.getResult());
        int total = (int) page.getTotal();
        int rootId = categoryMapper.getIdByName(categoryName);
        List<Article> result = articleMapper.getArticlesByCategoryId(rootId);
        List<Category> categoryList = categoryMapper.getCategoryListByParentId(rootId);
        while(categoryList != null && categoryList.size() != 0){
            List<Category> nextCategoryList = new ArrayList<>();
            for (Category category : categoryList) {
                List<Article> articleList = articleMapper.getArticlesByCategoryId(category.getId());
                total += articleList.size();
                result.addAll(articleList);
                nextCategoryList.addAll(categoryMapper.getCategoryListByParentId(category.getId()));
            }
            categoryList.clear();
            categoryList = new ArrayList<>(nextCategoryList);
        }
        if(currentPage != null && pageSize != null){
            int begin = (currentPage-1)*pageSize;
            int end = Math.min(begin+pageSize, result.size());
            result = result.subList(begin,end);
            return new PageResult(total,result);
        }
        return new PageResult(total,result.subList(0,Math.min(5,result.size())));
    }
    /**
     * 根据搜索内容获取文章信息
     * @param searchValue
     * @return
     */
    public PageResult getArticlesBySearch(String searchValue,Integer pageSize,Integer currentPage) {
        PageHelper.startPage(1,5);
        if(currentPage != null && pageSize != null){
            PageHelper.startPage(currentPage,pageSize);
        }
        Page<Article> page = articleMapper.getArticlesBySearch(searchValue);
        return new PageResult(page.getTotal(),page.getResult());
    }

    /**
     * 删除指定id的文章，数据库和文件夹中同时删除
     * @param id
     * @param filePath
     * @return
     */
    @Transactional
    public void deleteById(Integer id, String filePath) {
        articleMapper.deleteById(id);
    }

    /**
     * 根据id获取文章名
     * @param id
     * @return
     */
    public String getArticleTitleById(Integer id) {
        return articleMapper.getArticleTitleById(id);
    }
    /**
     * 根据id更新文章信息
     * @param articleDTO
     * @return
     */
    @Transactional
    public void update(ArticleDTO articleDTO) {
        Article article = new Article();
        BeanUtils.copyProperties(articleDTO,article);
        int categoryId = categoryMapper.getIdByName(articleDTO.getCategoryName());
        article.setUpdateTime(LocalDateTime.now());
        article.setCategoryId(categoryId);
        articleMapper.update(article);
    }
    /**
     * 新增md文件
     * @param saveArticleDTO
     * @return
     */
    public void save(SaveArticleDTO saveArticleDTO) {
        Article article = new Article();
        BeanUtils.copyProperties(saveArticleDTO,article);
        article.setCreateTime(LocalDateTime.now());
        article.setUpdateTime(LocalDateTime.now());
        article.setCategoryId(categoryMapper.getIdByName(article.getCategoryName()));
        Article originArticle = articleMapper.getArticleByTitle(saveArticleDTO.getOriginTitle());
        if(originArticle != null){
            article.setId(originArticle.getId());
            articleMapper.update(article);
        }else {
            articleMapper.save(article);
        }

    }
    /**
     * 根据title获取文章信息
     * @param articleTitle
     * @return
     */
    public Article getArticleByTitle(String articleTitle) {
        return articleMapper.getArticleByTitle(articleTitle);
    }

    public List<Integer> getEverydayCountsByTime(String beginTime, String endTime) {
        //转成日期
        //遍历，从begin到end，每次plus一天
        //查找日期时间段下的文章数量
        return null;
    }
    /**
     * 获取文章的点赞相关信息
     * @param articleTitle
     * @return
     */
    public ArticleLike getArticleLike(String articleTitle) {
        ArticleLike articleLike = articleMapper.getArticleLikeByArticleTitle(articleTitle);
        if (articleLike == null){
            articleLike = new ArticleLike();
            articleLike.setArticleTitle(articleTitle);
            articleLike.setArticleId(articleMapper.getArticleByTitle(articleTitle).getId());
            articleLike.setLikeNum(0);
            articleLike.setLikeNum(0);
            articleLike.setSmileNum(0);
            articleMapper.addArticleLike(articleLike);
        }

        return articleLike;
    }
    /**
     * 更新文章和用户点赞信息
     * @param userLikeDTO
     * @return
     */
    @Transactional
    public void updateLike(UserLikeDTO userLikeDTO) {
        UserLike userLike = new UserLike();
        BeanUtils.copyProperties(userLikeDTO,userLike);
        //获取文章id
        userLike.setArticleId(articleMapper.getArticleByTitle(userLikeDTO.getArticleTitle()).getId());
        //更新该条数据
        articleMapper.updateUserLike(userLike);
        //更新文章点赞信息
        articleMapper.updateArticleLike(userLike);
    }
    /**
     * 获取用户的点赞相关信息
     * @param userLikeDTO
     * @return
     */
    public UserLike getUserLike(UserLikeDTO userLikeDTO) {
        UserLike userLike = new UserLike();
        BeanUtils.copyProperties(userLikeDTO,userLike);
        //获取文章id
        userLike.setArticleId(articleMapper.getArticleByTitle(userLikeDTO.getArticleTitle()).getId());
        //判断数据库是否存在该条数据，为空则插入
        UserLike userLike1 = articleMapper.getUserLikeByBrowserIdAndArticleId(userLike);
        if(userLike1 == null){
            articleMapper.insertUserLike(userLike);
            return userLike;
        }
        return userLike1;
    }

}
