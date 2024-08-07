package com.mblog.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;


public class FileUtils {

    public static String uploadImg(MultipartFile file,String path1,  String name, String path2){
        String uuid = UUID.randomUUID().toString();
        try {
            // 上传操作
            File imgFile = new File(path1, uuid+name);
            file.transferTo(imgFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 返回图片的路径
        return path2 + uuid+name;
    }
}