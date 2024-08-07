package com.mblog.controller.admin;

import com.mblog.annotation.Log;
import com.mblog.dto.MemoDTO;
import com.mblog.entity.Memo;
import com.mblog.enums.BusinessType;
import com.mblog.result.Result;
import com.mblog.service.MemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("memo")
@RequestMapping("/admin/memo")
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

    /**
     * 新增备忘
     * @param memoDTO
     * @return
     */
    @Log(operation = "新增备忘",businessType = BusinessType.INSERT)
    @PostMapping
    public Result save(@RequestBody MemoDTO memoDTO){
        log.info("新增备忘:{}",memoDTO);
        memoService.save(memoDTO);
        return Result.success();
    }

    /**
     * 根据id修改备忘信息
     * @param memoDTO
     * @return
     */
    @Log(operation = "根据id修改备忘",businessType = BusinessType.UPDATE)
    @PutMapping
    public Result update(@RequestBody MemoDTO memoDTO){
        log.info("更新备忘信息:{}",memoDTO);
        memoService.update(memoDTO);
        return Result.success();
    }
    /**
     * 根据id删除备忘
     * @param id
     */
    @Log(operation = "根据id删除备忘",businessType = BusinessType.DELETE)
    @DeleteMapping
    public Result delete(Integer id){
        log.info("删除备忘，id：{}",id);
        memoService.delete(id);
        return Result.success();
    }
}
