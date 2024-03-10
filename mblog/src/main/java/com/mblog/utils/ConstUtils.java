package com.mblog.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ConstUtils {
    public static String REQUEST_IMG_PATH = "/mymd/imgs/";
    public static String IMG_UPLOAD_FAILURE = "图片上传失败";
}
