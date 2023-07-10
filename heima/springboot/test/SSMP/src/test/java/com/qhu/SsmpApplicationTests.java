package com.qhu;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qhu.dao.BookDao;
import com.qhu.domain.Book;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SsmpApplicationTests {
    @Autowired
    BookDao bookDao;

    @Test
    void testGetByID() {
        System.out.println(bookDao.selectById(2));
    }
    @Test
    void testSave() {
        Book book = new Book();
        book.setName("测试2");
        book.setType("测试2");
        book.setDescription("测试2");
        bookDao.insert(book);
    }
    @Test
    void testUpdate() {
        Book book = new Book();
        book.setId(102);
        book.setName("测试4");
        book.setType("测试4");
        book.setDescription("测试4");
        bookDao.updateById(book);
    }
    @Test
    void testDelete() {

        bookDao.deleteById(102);
    }
    @Test
    void testGetAll() {
        System.out.println(bookDao.selectList(null));
    }

    @Test
    void testGetPage() {
        IPage iPage =new Page(1,5);
        bookDao.selectPage(iPage,null);
        System.out.println(iPage.getCurrent());
        System.out.println(iPage.getSize());
        System.out.println(iPage.getTotal());
        System.out.println(iPage.getPages());
        System.out.println(iPage.getRecords());
    }
    @Test
    void testGetBy() {
        QueryWrapper<Book> qw = new QueryWrapper<>();
        qw.like("name","spring");
//        qw.eq
//        qw.lt
//        qw.gt
//        qw.groupBy()
        System.out.println(bookDao.selectList(qw));
    }
    @Test
    void testGetBy2() {
        String name = null;
        LambdaQueryWrapper<Book> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.like(name!=null,Book::getName,name);
        System.out.println(bookDao.selectList(lambdaQueryWrapper));
    }
}
