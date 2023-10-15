package com.qhu.controller;

import com.qhu.Readdata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/books")
public class BookController {
    @Value("${country}")
    private String ct;
    @Value("${user.name}")
    private String name;
    @Value("${likes[1]}")
    private String like1;
    @Value("${name1}")
    private String myname;
    //自动装配
    @Autowired
    private Environment env;
    @Autowired
    private Readdata readdata;
    @GetMapping
    public String getById(){
        System.out.println("springboot is running,,,");
        System.out.println("ct:"+ct);
        System.out.println("name"+name);
        System.out.println("like1"+like1);
        System.out.println("mynameis"+myname);
        System.out.println(env.getProperty("name1"));
        System.out.println("readdata:"+readdata.toString());
        return "springboot is running,,,";
    }
}
