package com.mblog.service.impl;

import com.mblog.dto.MemoDTO;
import com.mblog.entity.Memo;
import com.mblog.mapper.MemoMapper;
import com.mblog.service.MemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
@Service
@Slf4j
public class MemoServiceImpl implements MemoService {

    @Autowired
    private MemoMapper memoMapper;
    /**
     * 根据日期获取备忘录
     * @param time
     * @return
     */
    public List<Memo> getMemoListByTime(String time) {
        LocalDate date = LocalDate.parse(time, DateTimeFormatter.ISO_DATE);
        LocalTime time2 = LocalTime.of(0, 0);  // 默认时间为午夜
        LocalDateTime dateTime = LocalDateTime.of(date, time2);
        LocalDateTime dateTime2 = LocalDateTime.of(date.plusDays(1), time2);
        return memoMapper.getMemoListByTime(dateTime,dateTime2);
    }

    /**
     * 新增备忘
     * @param memoDTO
     */
    @Transactional
    public void save(MemoDTO memoDTO) {
        Memo memo = new Memo();
        BeanUtils.copyProperties(memoDTO,memo);
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        memo.setDate(LocalDateTime.parse(memoDTO.getDate(), fmt));
        memo.setCreateTime(LocalDateTime.now());
        memoMapper.save(memo);
    }

    /**
     * 根据id修改备忘信息
     * @param memoDTO
     * @return
     */
    @Transactional
    public void update(MemoDTO memoDTO) {
        Memo memo = new Memo();
        BeanUtils.copyProperties(memoDTO,memo);
        if(memoDTO.getDate() != null && memoDTO.getDate() != ""){
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            memo.setDate(LocalDateTime.parse(memoDTO.getDate(), fmt));
        }
        memoMapper.update(memo);
    }

    /**
     * 根据id删除备忘
     * @param id
     */
    public void delete(Integer id) {
        memoMapper.deleteById(id);
    }
}
