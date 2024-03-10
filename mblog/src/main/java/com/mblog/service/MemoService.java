package com.mblog.service;

import com.mblog.dto.MemoDTO;
import com.mblog.entity.Memo;

import java.util.List;

public interface MemoService {
    /**
     * 根据日期获取备忘录
     * @param time
     * @return
     */
    List<Memo> getMemoListByTime(String time);

    /**
     * 新增备忘
     * @param memoDTO
     */
    void save(MemoDTO memoDTO);

    /**
     * 根据id修改备忘信息
     * @param memoDTO
     * @return
     */
    void update(MemoDTO memoDTO);

    /**
     * 根据id删除备忘
     * @param id
     */
    void delete(Integer id);
}
