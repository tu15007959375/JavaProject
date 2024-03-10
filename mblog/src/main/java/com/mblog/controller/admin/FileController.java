package com.mblog.controller.admin;

import com.mblog.result.Result;
import com.mblog.utils.ConstUtils;
import com.mblog.utils.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;

@RestController
public class FileController {
    @Value("${imgSavePath}")
    public String imgSavePath;

    @PostMapping("/admin/article/uploadImg")
    public Result img(@RequestParam(value = "file") MultipartFile file){
        try{
            String res = new FileUtils().uploadImg(file,imgSavePath,
                    Objects.requireNonNull(file.getOriginalFilename()),
                    ConstUtils.REQUEST_IMG_PATH);
            return Result.success(res);
        }catch (Exception e){
            e.printStackTrace();
            return Result.error(ConstUtils.IMG_UPLOAD_FAILURE);
        }
    }
}