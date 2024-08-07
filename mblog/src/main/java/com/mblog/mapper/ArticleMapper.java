package com.mblog.mapper;

import com.github.pagehelper.Page;
import com.mblog.entity.Article;
import com.mblog.entity.ArticleLike;
import com.mblog.entity.UserLike;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ArticleMapper {
    @Select("select * from article order by createTime desc")
    List<Article> getAllArticles();

    /**
     * 根据分类名称查询文章
     * @return
     */
    @Select("select * from article where categoryName = #{categoryName} order by createTime desc")
    List<Article> selectArticlesByCategoryName(String categoryName);

    /**
     * 根据分类名称和每页大小以及第几页获取文章信息
     * @param categoryName
     * @param pageSize
     * @param currentPage
     * @return
     */
    Page<Article> getArticlesByCategoryNameAndPage(@Param("categoryName") String categoryName,@Param("pageSize") Integer pageSize,@Param("currentPage") Integer currentPage);

    /**
     * 根据分类id获取文章列表
     * @param id
     * @return
     */
    @Select("select * from article where categoryId = #{id} order by createTime desc")
    List<Article> getArticlesByCategoryId(Integer id);

    /**
     * 根据搜索内容获取文章信息
     * @param searchValue
     * @return
     */
    Page<Article> getArticlesBySearch(@Param("searchValue") String searchValue);

    /**
     * 删除指定id的文章，数据库和文件夹中同时删除
     * @param id
     * @return
     */
    @Delete("delete from article where id = #{id}")
    void deleteById(Integer id);

    /**
     * 根据id获取文章名
     * @param id
     * @return
     */
    @Select("select title from article where id = #{id}")
    String getArticleTitleById(Integer id);

    /**
     * 根据id更新文章信息
     * @param article
     * @return
     */
    void update(Article article);

    /**
     * 新增md文件
     * @param article
     */
    @Insert("insert into article(title, intro, createTime, updateTime, categoryId, categoryName,pageView) VALUES (#{title},#{intro},#{createTime},#{updateTime},#{categoryId},#{categoryName},#{pageView})")
    void save(Article article);

    /**
     * 根据title获取article
     * @param title
     * @return
     */
    @Select("select * from article where title = #{title}")
    Article getArticleByTitle(String title);

    /**
     * 根据title获取文章点赞信息
     * @param articleTitle
     * @return
     */
    @Select("select * from articlelike where articleTitle = #{articleTitle}")
    ArticleLike getArticleLikeByArticleTitle(String articleTitle);

    /**
     * 插入文章点赞信息
     * @param articleLike
     */
    @Insert("insert into articlelike(articleId, articleTitle, likeNum, loveNum, smileNum) values (#{articleId}, #{articleTitle}, #{likeNum}, #{loveNum}, #{smileNum})")
    void addArticleLike(ArticleLike articleLike);
    /**
     * 更新文章和用户点赞信息
     * @param userLike
     * @return
     */
    void updateUserLike(UserLike userLike);

    /**
     * 根据浏览器id和文章id查找用户喜欢信息
     * @param userLike
     * @return
     */
    @Select("select * from userlike where browserId = #{browserId} and articleId = #{articleId}")
    UserLike getUserLikeByBrowserIdAndArticleId(UserLike userLike);

    /**
     * 插入用户点赞信息
     * @param userLike
     */
    @Insert("insert into userlike(browserId, articleId, likeflag, loveflag, smileflag) VALUES (#{browserId},#{articleId},#{likeflag},#{loveflag},#{smileflag})")
    void insertUserLike(UserLike userLike);

    /**
     * 更新文章点赞信息
     * @param userLike
     */
    void updateArticleLike(UserLike userLike);

    /**
     * 根据id获取文章
     * @param id
     * @return
     */
    @Select("select * from article where id = #{id}")
    Article getArticlesById(Integer id);
}
