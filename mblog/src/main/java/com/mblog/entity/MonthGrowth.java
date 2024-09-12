package com.mblog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MonthGrowth {
    /**
     * 用于统计每月增长信息的实体类，例如每月新增访问，每个新增点赞等
     */
    int id;
    LocalDate date;
    String name;
    int nums;
}
