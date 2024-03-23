package com.mblog.controller.admin;
import com.mblog.dto.ArticleDTO;
import com.mblog.dto.SaveArticleDTO;
import com.mblog.entity.Article;
import com.mblog.result.Result;
import com.mblog.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController("adminArticleController")
@RequestMapping("/admin/article")
@Slf4j
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    /**
     * 新增md文件
     * @param saveArticleDTO
     * @return
     */
    @PostMapping
    @CacheEvict(value = "categoryCache",key = "'categoryCache'")
    public Result save(@RequestBody SaveArticleDTO saveArticleDTO) throws IOException {
        log.info("保存md文件:{}",saveArticleDTO);
        //保存文件
        File file = new File(saveArticleDTO.getFilePath() + "/" + saveArticleDTO.getTitle() + ".md");
        File originfile = new File(saveArticleDTO.getFilePath() + "/" + saveArticleDTO.getOriginTitle() + ".md");
        if(!file.exists()){
            file.createNewFile();
        }
        if(originfile.exists()){
            originfile.delete();
        }
        FileWriter writer = new FileWriter(file);
        BufferedWriter out = new BufferedWriter(writer);
        out.write(saveArticleDTO.getText());
        out.flush();

        articleService.save(saveArticleDTO);
        out.close();
        writer.close();
        return Result.success();
    }
    /**
     * 删除指定id的文章，数据库和文件夹中同时删除
     * @param id
     * @param filePath
     * @return
     */
    @DeleteMapping
    @CacheEvict(value = "categoryCache",key = "'categoryCache'")
    public Result deleteById(@RequestParam Integer id,@RequestParam String filePath){
        String fileName = articleService.getArticleTitleById(id);
        File file = new File(filePath + "/" + fileName + ".md");
        log.info("删除文章id：{},{}",id,filePath + "/" + fileName + ".md");
        if(file.exists()){
            if(file.delete()){
                articleService.deleteById(id,filePath);
                return Result.success();
            }else{
                return Result.error("文件删除失败!");
            }
        }else{
            return Result.error("文件夹中不存在该文件!");
        }
    }

    /**
     * 根据id更新文章信息
     * @param saveArticleDTO
     * @return
     */
    @PutMapping
    public Result update(@RequestBody SaveArticleDTO saveArticleDTO) throws IOException {
        String fileName = saveArticleDTO.getOriginTitle();
        File file = new File(saveArticleDTO.getFilePath() + "/" + fileName + ".md");
        log.info("更新文章信息:{},{}",saveArticleDTO,saveArticleDTO.getFilePath() + "/" + fileName + ".md");
        if(file.exists()){
            FileWriter writer;
            if(saveArticleDTO.getOriginTitle().equals(saveArticleDTO.getTitle())){
                writer = new FileWriter(file);
            }else{
                file.delete();
                writer = new FileWriter(new File(saveArticleDTO.getFilePath() + "/" + saveArticleDTO.getTitle() + ".md"));
            }
            writer.write(saveArticleDTO.getText());
            writer.flush();
            writer.close();
            articleService.update(saveArticleDTO);
            return Result.success();
        }else{
            return Result.error("文件夹中不存在该文件");
        }
    }
}
