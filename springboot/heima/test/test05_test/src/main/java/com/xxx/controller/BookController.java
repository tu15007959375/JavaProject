package com.xxx.controller;

import com.xxx.domain.Book;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/books")
public class BookController {
//    @GetMapping
//    public String getById(){
//        System.out.println("getbyid is running--------");
//        return "springboot";
//    }
    @GetMapping
    public Book getById(){
        Book book = new Book();
        book.setId(1);
        book.setName("tjx");
        book.setType("ee");
        book.setDescription("aaaa");
        return book;
    }
}
