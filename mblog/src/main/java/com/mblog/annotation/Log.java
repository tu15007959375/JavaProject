package com.mblog.annotation;

import com.mblog.enums.BusinessType;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 *
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 操作名称
     * @return
     */
    String operation() default "";

    /**
     * 操作的类型
     * @return
     */
    BusinessType businessType() default BusinessType.OTHER;
}
