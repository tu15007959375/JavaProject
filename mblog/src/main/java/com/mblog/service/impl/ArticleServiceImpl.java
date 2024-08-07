package com.mblog.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
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
import com.mblog.vo.UserLikeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private RedisTemplate<Object,Object> redisTemplate;

    private List<Integer> rootCategoryIds = new ArrayList<>();
    /**
     * 根据分类名称和每页大小以及第几页获取文章信息
     * @return
     */
    public PageResult getArticlesByCategoryNameAndPage(String categoryName, Integer pageSize, Integer currentPage, Integer order) {


        String cmp,filed = "createTime";
        if(order < 0){
            cmp = "asc";
        }else{
            cmp = "desc";
        }
        if(Math.abs(order) == 1){
            filed = "title";
        } else if (Math.abs(order) == 2) {
            filed = "intro";
        }else if (Math.abs(order) == 3) {
            filed = "createTime";
        }else if (Math.abs(order) == 4) {
            filed = "updateTime";
        }else if (Math.abs(order) == 5) {
            filed = "pageView";
        }
        PageHelper.startPage(currentPage,pageSize,filed+" "+cmp);
        Page<Article> page = articleMapper.getArticlesByCategoryNameAndPage(categoryName,pageSize,currentPage);

        return new PageResult(page.getTotal(),page.getResult());
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
        Article article = articleMapper.getArticlesById(id);
        articleMapper.deleteById(id);
        id = getRootCategoryId(article.getCategoryId());
        for (Integer rootCategory : rootCategoryIds) {
            categoryMapper.deloneByCategoryId(rootCategory);
        }
        redisTemplate.delete("category"+id);
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
     * @param saveArticleDTO
     * @return
     */
    @Transactional
    public void update(SaveArticleDTO saveArticleDTO) {

        Article article = new Article();
        BeanUtils.copyProperties(saveArticleDTO,article);
        Article oldArticle = articleMapper.getArticleByTitle(saveArticleDTO.getOriginTitle());
        article.setUpdateTime(LocalDateTime.now());
        article.setId(oldArticle.getId());
        article.setCategoryId(categoryMapper.getIdByName(article.getCategoryName()));
        int rootId = getRootCategoryId(article.getCategoryId());
        redisTemplate.delete("category"+rootId);
        if(oldArticle.getCategoryId() != article.getCategoryId()){
            for (Integer rootCategory : rootCategoryIds) {
                categoryMapper.addoneByCategoryId(rootCategory);
            }
            int oldRootId = getRootCategoryId(oldArticle.getCategoryId());
            for (Integer rootCategory : rootCategoryIds) {
                categoryMapper.deloneByCategoryId(rootCategory);
            }
            redisTemplate.delete("category" + oldRootId);
        }
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
        article.setCategoryName(saveArticleDTO.getCategoryName());
        article.setCategoryId(categoryMapper.getIdByName(article.getCategoryName()));
        article.setPageView(0L);
//        int curId = article.getCategoryId();
        int rootId = getRootCategoryId(article.getCategoryId());
        for (Integer rootCategory : rootCategoryIds) {
            categoryMapper.addoneByCategoryId(rootCategory);
        }
        redisTemplate.delete("category"+rootId);
        articleMapper.save(article);
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
    public UserLikeVO getUserLike(UserLikeDTO userLikeDTO) {
        UserLikeVO userLikeVO = new UserLikeVO();
        Article article = articleMapper.getArticleByTitle(userLikeDTO.getArticleTitle());
        article.setPageView(article.getPageView()+1);
        articleMapper.update(article);
        BeanUtils.copyProperties(article,userLikeVO);
        //判断数据库是否存在该条数据，为空则插入
        UserLike userLike = new UserLike();
        BeanUtils.copyProperties(userLikeDTO,userLike);
        userLike.setArticleId(article.getId());
        UserLike userLike1 = articleMapper.getUserLikeByBrowserIdAndArticleId(userLike);
        if(userLike1 == null){
            articleMapper.insertUserLike(userLike);
            userLikeVO.setLikeflag(0);
            userLikeVO.setLoveflag(0);
            userLikeVO.setSmileflag(0);
            return userLikeVO;
        }
        BeanUtils.copyProperties(userLike1,userLikeVO);
        return userLikeVO;
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
