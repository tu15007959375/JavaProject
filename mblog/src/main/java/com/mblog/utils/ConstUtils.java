package com.mblog.utils;

import org.springframework.context.annotation.Configuration;

@Configuration
public class ConstUtils {
    public final static String REQUEST_IMG_PATH = "/mymd/imgs/";
    public final static String IMG_UPLOAD_FAILURE = "图片上传失败";
    public final static String FILE_EXIST = "文件已存在";
    public final static String FILE_NOT_EXIST = "文件不存在";
    public final static String DELETE_FAIL = "删除失败";
    public final static String JWT_AUTHENTICATION_FAIL = "jwt验证失败";
    public final static String ARTICLE_TITLE_NOT_BLANK = "文章名不能为空";
    public final static String CATEGORY_NAME_NOT_BLANK = "分类名不能为空";
    public final static String FILEPATH_NOT_BLANK = "路径不能为空";
    public final static String ID_NOT_NULL="ID不能为空";
    public final static String CATEGORY_LEVEL_NOT_BLANK="分类层级不能为空";
    public final static String FILE_NOT_NULL = "文件不能为空";
    public final static String MEMO_NAME_NOT_BLANK = "备忘内容不能为空";
    public final static String MEMO_DATE_NOT_BLANK = "备忘日期不能为空";
    public final static String MEMO_TAG_NOT_NULL = "备忘重要度不能为空";
    public final static String MEMO_STATUS_NOT_NULL = "备忘状态不能为空";

    public final static String TYPE_CONVERT_EXCEPTION = "类型转换异常";
    public final static String PARAM_AUTHENTICATION_EXCEPTION = "参数校验异常";
    public final static String PARAM_ERROR_EXCEPTION="参数错误异常";
    public final static String UNKNOWN_EXCEPTION="未知异常";
}
