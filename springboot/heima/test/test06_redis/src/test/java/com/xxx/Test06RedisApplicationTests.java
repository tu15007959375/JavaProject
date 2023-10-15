package com.xxx;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

@SpringBootTest
class Test06RedisApplicationTests {

    @Autowired
    private RedisTemplate redisTemplate;
    @Test
    void set() {
        ValueOperations ops = redisTemplate.opsForValue();
        ops.set("name","tujinxing");
    }
    @Test
    void get() {
        ValueOperations ops = redisTemplate.opsForValue();
        Object name = ops.get("name");
        System.out.println(name);
    }
    @Test
    void hset() {
        HashOperations ops = redisTemplate.opsForHash();
        ops.put("info","aaa","aa");
    }
    @Test
    void hget() {
        HashOperations ops = redisTemplate.opsForHash();
        Object o = ops.get("info", "aaa");
        System.out.println(o);

    }

}
