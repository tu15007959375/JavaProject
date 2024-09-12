package com.mblog.controller.user;

import com.mblog.entity.Memo;
import com.mblog.result.Result;
import com.mblog.service.MemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("userMemoController")
@RequestMapping("/user/memo")
@Slf4j
public class MemoController {
    @Autowired
    private MemoService memoService;
    /**
     * 根据日期获取备忘录
     * @param time
     * @return
     */
    @GetMapping("/list/{time}")
    public Result<List<Memo>> getMemoListByTime(@PathVariable String time){
        log.info("获取日期：{}备忘录：",time);
        List<Memo> memoList = memoService.getMemoListByTime(time);
        return Result.success(memoList);
    }
}
