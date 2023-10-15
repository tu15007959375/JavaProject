package com.xxx.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxx.domain.Book;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDao extends BaseMapper<Book> {
}
