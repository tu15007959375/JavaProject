package com.mblog.tasks;

import com.mblog.entity.MonthGrowth;
import com.mblog.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

@Component
public class CreateMonthGrowthTask {

    @Autowired
    private ArticleMapper articleMapper;

    @Scheduled(cron = "0 0 0 1 * ?")
    public void insertMonthGrowth() {
        System.out.println("task：检测月增长表中该月字段是否存在");
        hasGrowth("pageViews");
        hasGrowth("likeNums");
    }

    private void hasGrowth(String name) {
        //更新月增长表或月点赞表
        LocalDate date = LocalDate.now();
        //当前月第一天
        LocalDate firstDay = date.with(TemporalAdjusters.firstDayOfMonth());
        MonthGrowth monthGrowth =  articleMapper.getMonthGrowthByNameAndDate(firstDay,name);
        //当月信息不存在，新建
        if(monthGrowth == null){
            monthGrowth = new MonthGrowth();
            monthGrowth.setDate(firstDay);

            LocalDate lastMonthFirstDay = date.minusMonths(1).with(TemporalAdjusters.firstDayOfMonth());
            MonthGrowth temp = articleMapper.getMonthGrowthByNameAndDate(lastMonthFirstDay,name);
            if(temp == null){
                monthGrowth.setNums(0);
            }else {
                monthGrowth.setNums(temp.getNums());
            }
            monthGrowth.setName(name);
            articleMapper.insertMonthGrowth(monthGrowth);
        }
    }
}
