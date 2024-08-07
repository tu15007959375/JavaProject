package com.mblog.mapper;

import com.mblog.dto.MemoDTO;
import com.mblog.entity.Memo;
import org.apache.ibatis.annotations.*;

import java.time.LocalDateTime;
import java.util.List;

@Mapper
public interface MemoMapper {
    /**
     * 根据日期获取备忘录
     * @param time1,time2
     * @return
     */
    @Select("select * from memo where date < #{time2} and date >= #{time1} order by tag asc,date asc")
    List<Memo> getMemoListByTime(@Param("time1") LocalDateTime time1,@Param("time2") LocalDateTime time2);

    /**
     * 插入备忘
     * @param memo
     */
    @Insert("insert into memo(name, tag, createTime, status, date) values(#{name},#{tag},#{createTime},#{status},#{date})")
    void save(Memo memo);

    /**
     * 根据id更新备忘信息
     * @param memo
     */
    void update(Memo memo);

    /**
     * 根据id删除备忘
     * @param id
     */
    @Delete("delete from memo where id = #{id}")
    void deleteById(Integer id);
}
