package com.mblog.controller.admin;

import com.mblog.annotation.Log;
import com.mblog.dto.SaveArticleDTO;
import com.mblog.enums.BusinessType;
import com.mblog.result.Result;
import com.mblog.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import static com.mblog.utils.ConstUtils.*;

@RestController("adminArticleController")
@RequestMapping("/admin/article")
@Slf4j
@Validated
public class ArticleController {
    //todo 前端管理页面首页token过期检测
    //todo md文章导入功能实现
    @Autowired
    private ArticleService articleService;

    /**
     * 新增md文件
     * @param saveArticleDTO
     * @return
     */
    @Log(operation = "新增/更新文章",businessType = BusinessType.INSERT)
    @PostMapping
    public Result save(@Validated @RequestBody SaveArticleDTO saveArticleDTO) throws IOException {
        log.info("新增/更新md文件:{}",saveArticleDTO);
        //保存文件
        int tag = 0;
        File file = new File(saveArticleDTO.getFilePath() + "/" + saveArticleDTO.getTitle() + ".md");
        File originfile = new File(saveArticleDTO.getFilePath() + "/" + saveArticleDTO.getOriginTitle() + ".md");
        if(originfile.exists() && file.exists()){
            return Result.error(FILE_EXIST);
        }

        if(originfile.exists()){
            originfile.delete();
            tag = 1;
        }

        if(!file.exists()){
            file.createNewFile();
        }else{
            tag = 1;
        }

        FileWriter writer = new FileWriter(file);
        BufferedWriter out = new BufferedWriter(writer);
        if(saveArticleDTO.getText() != null && saveArticleDTO.getText() != ""){
            out.write(saveArticleDTO.getText());
        }
        out.flush();
        out.close();
        writer.close();
        if(tag == 1){
            if(saveArticleDTO.getOriginTitle() == null || saveArticleDTO.getOriginTitle().isEmpty())
                saveArticleDTO.setOriginTitle(saveArticleDTO.getTitle());
            articleService.update(saveArticleDTO);
        }else{
            articleService.save(saveArticleDTO);
        }

        return Result.success();
    }
    /**
     * 删除指定id的文章，数据库和文件夹中同时删除
     * @param id
     * @param filePath
     * @return
     */
    @Log(operation = "根据id删除文章",businessType = BusinessType.DELETE)
    @DeleteMapping
    public Result deleteById(@RequestParam @Min(1) Integer id,@RequestParam @NotBlank(message = "文件路径不能为空") String filePath){
        String fileName = articleService.getArticleTitleById(id);
        File file = new File(filePath + "/" + fileName + ".md");
        log.info("删除文章id：{},{}",id,filePath + "/" + fileName + ".md");
        if(file.exists()){
            if(file.delete()){
                articleService.deleteById(id,filePath);
                return Result.success();
            }else{
                return Result.error(DELETE_FAIL);
            }
        }else{
            return Result.error(FILE_NOT_EXIST);
        }
    }
}
