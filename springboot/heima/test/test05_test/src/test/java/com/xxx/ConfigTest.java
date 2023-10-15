package com.xxx;

import com.xxx.config.MsgConfig;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@SpringBootTest
@Import({MsgConfig.class})
public class ConfigTest {
    @Autowired
    private String msg;
    @Test
    void testmsg(){
        System.out.println(msg);
    }
}
