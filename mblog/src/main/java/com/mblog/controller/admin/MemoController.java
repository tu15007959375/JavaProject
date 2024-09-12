package com.mblog.controller.admin;

import com.mblog.annotation.Log;
import com.mblog.dto.MemoDTO;
import com.mblog.enums.BusinessType;
import com.mblog.result.Result;
import com.mblog.service.MemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;

@RestController("adminMemoController")
@RequestMapping("/admin/memo")
@Slf4j
@Validated
public class MemoController {
    @Autowired
    private MemoService memoService;

    /**
     * 新增备忘
     * @param memoDTO
     * @return
     */
    @Log(operation = "新增备忘",businessType = BusinessType.INSERT)
    @PostMapping
    public Result save(@RequestBody @Validated MemoDTO memoDTO){
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
    public Result update(@RequestBody @Validated MemoDTO memoDTO){
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
    public Result delete(@Min(1) Integer id){
        log.info("删除备忘，id：{}",id);
        memoService.delete(id);
        return Result.success();
    }
}
