package com.test03_mybatisplus.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.test03_mybatisplus.domain.Book;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDao extends BaseMapper<Book> {
}
