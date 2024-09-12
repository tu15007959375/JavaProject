package com.mblog.mapper;

import com.github.pagehelper.Page;
import com.mblog.entity.Article;
import com.mblog.entity.ArticleLike;
import com.mblog.entity.MonthGrowth;
import com.mblog.entity.UserLike;
import org.apache.ibatis.annotations.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    Page<Article> getArticlesByCategoryNameAndPage(@Param("categoryName") String categoryName,@Param("pageSize") Integer pageSize,@Param("currentPage") Integer currentPage,@Param("searchValue") String searchValue);

    /**
     * 根据分类id获取文章列表
     * @param id
     * @return
     */
    @Select("select * from article where categoryId = #{id} order by createTime desc")
    List<Article> getArticlesByCategoryId(Integer id);


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

    /**
     * 根据开始和结束时间获取文章数量
     * @param beginTime
     * @param endTime
     * @return
     */
    @Select("select count(*) from article where createTime >= #{beginTime} && createTime < #{endTime}")
    Integer getCountsByTime(@Param("beginTime") LocalDateTime beginTime, @Param("endTime") LocalDateTime endTime);

    /**
     * 获取文章总数
     * @return
     */
    @Select("select count(*) from article")
    int getAllArticlesNums();

    /**
     * 获取文章访问量总数
     * @return
     */
    @Select("select SUM(pageView) from article")
    Integer getAlLPageViewNums();

    /**
     * 获取文章点赞总数
     * @return
     */
    @Select("select SUM(likeNum) from articlelike")
    Integer getAllLikeNums();

    /**
     * 根据日期和name获取实体类
     * @param date
     * @param name
     * @return
     */
    @Select("select * from month_growth where date = #{date} and name = #{name}")
    MonthGrowth getMonthGrowthByNameAndDate(@Param("date") LocalDate date, @Param("name") String name);

    /**
     * 插入实体
     * @param monthGrowth
     */
    @Insert("insert into month_growth(date, name, nums) VALUES (#{date},#{name},#{nums})")
    void insertMonthGrowth(MonthGrowth monthGrowth);

    /**
     * 访问量+1
     * @param date
     * @param name
     */
    @Update("update month_growth set nums = nums+1 where date = #{date} and name=#{name}")
    void addNumsByNameAndDate(@Param("date") LocalDate date, @Param("name") String name);

    @Select("select nums from month_growth where date = #{date} and name=#{name} ")
    Integer getNumsByNameAndDate(@Param("date") LocalDate date, @Param("name") String name);
}
