package com.xxx;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

//@SpringBootTest(properties = {"test.prop=xixixx"})
@SpringBootTest(args = {"--test.prop=yyyyy"})
public class PropertiesAndArgsTest {
    @Value("${test.prop}")
    private String msg;
    @Test
    void testProperties(){
        System.out.println(msg);
    }
}
