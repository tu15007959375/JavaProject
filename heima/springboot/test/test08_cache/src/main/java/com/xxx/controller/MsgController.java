package com.xxx.controller;

import com.xxx.domain.Book;
import com.xxx.service.BookService;
import com.xxx.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/msg")
public class MsgController {
    @Autowired
    private MsgService msgService;

    @GetMapping("{tele}")
    public String get(@PathVariable String tele){
        return msgService.get(tele);
    }

    @PostMapping
    public boolean check(String tele,String code){
        return msgService.check(tele,code);
    }


}
