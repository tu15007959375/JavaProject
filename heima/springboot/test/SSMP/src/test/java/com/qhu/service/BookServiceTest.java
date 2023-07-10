package com.qhu.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qhu.domain.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional//使得测试类不在数据库中进行增删改查
@Rollback(value = true)
public class BookServiceTest {
//    @Autowired
//    private BookService bookService;
    @Autowired
    private IBookService bookService;
    @Test
    void getById(){
        System.out.println(bookService.getById(4));
    }
    @Test
    void testSave() {
        Book book = new Book();
        book.setName("测试2");
        book.setType("测试2");
        book.setDescription("测试2");
        bookService.save(book);
    }
    @Test
    void testUpdate() {
        Book book = new Book();
        book.setId(104);
        book.setName("测试4");
        book.setType("测试4");
        book.setDescription("测试4");
        bookService.updateById(book);
    }
    @Test
    void testDelete() {
        bookService.removeById(104);
    }
    @Test
    void testGetAll() {
        System.out.println(bookService.list());
    }

    @Test
    void testGetPage() {
        IPage<Book> iPage = new Page<Book>(2,5);
        bookService.page(iPage);
        System.out.println(iPage.getCurrent());
        System.out.println(iPage.getSize());
        System.out.println(iPage.getTotal());
        System.out.println(iPage.getPages());
        System.out.println(iPage.getRecords());
    }

}
