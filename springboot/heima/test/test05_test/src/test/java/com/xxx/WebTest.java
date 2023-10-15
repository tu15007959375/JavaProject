package com.xxx;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.ContentResultMatchers;
import org.springframework.test.web.servlet.result.HeaderResultMatchers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.result.StatusResultMatchers;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@AutoConfigureMockMvc
public class WebTest {
    @Test
    void testWebStatus(@Autowired MockMvc mvc) throws Exception {
        MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.get("/books");
        //真实值
        ResultActions actions = mvc.perform(builder);
        //结果匹配器
        StatusResultMatchers status = MockMvcResultMatchers.status();
        ResultMatcher ok = status.isOk();
        //匹配真实值和预期值
        actions.andExpect(ok);
    }
    @Test
    void testBody(@Autowired MockMvc mvc) throws Exception {
        MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.get("/books");
        //真实值
        ResultActions actions = mvc.perform(builder);
        //结果匹配器
        ContentResultMatchers content = MockMvcResultMatchers.content();
        ResultMatcher re = content.string("springboot");
        //匹配真实值和预期值
        actions.andExpect(re);
    }

    @Test
    void testJson(@Autowired MockMvc mvc) throws Exception {
        MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.get("/books");
        //真实值
        ResultActions actions = mvc.perform(builder);
        //结果匹配器
        ContentResultMatchers content = MockMvcResultMatchers.content();
        ResultMatcher re = content.json("{\"id\":1,\"name\":\"tjx\",\"type\":\"ee\",\"description\":\"aaaa\"}");
        //匹配真实值和预期值
        actions.andExpect(re);
    }

    @Test
    void testContent(@Autowired MockMvc mvc) throws Exception {
        MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.get("/books");
        //真实值
        ResultActions actions = mvc.perform(builder);
        //结果匹配器
        HeaderResultMatchers header = MockMvcResultMatchers.header();
        ResultMatcher resultMatcher = header.string("Content-type", "application/json");
        //匹配真实值和预期值
        actions.andExpect(resultMatcher);
    }
    @Test
    void testGetById(@Autowired MockMvc mvc) throws Exception{
        MockHttpServletRequestBuilder builder = MockMvcRequestBuilders.get("/books");
        ResultActions actions = mvc.perform(builder);

        StatusResultMatchers status = MockMvcResultMatchers.status();
        ResultMatcher ok = status.isOk();
        actions.andExpect(ok);

        ContentResultMatchers content = MockMvcResultMatchers.content();
        ResultMatcher re = content.json("{\"id\":1,\"name\":\"tjx\",\"type\":\"ee\",\"description\":\"aaaa\"}");
        actions.andExpect(re);

        HeaderResultMatchers header = MockMvcResultMatchers.header();
        ResultMatcher resultMatcher = header.string("Content-type", "application/json");
        actions.andExpect(resultMatcher);
    }
}
