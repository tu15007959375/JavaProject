package com.mblog.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BaseInfoVO implements Serializable {


    //第一二栏相关信息
    Integer articleNums;
    Integer categoryNums;
    Integer likeNums;
    Integer pageViewNums;
    Integer articleMonthNums;
    Integer pageViewMonthNums;
    Integer likeMonthNums;

    //饼状图相关信息
//    Map<String,Integer> categoryMap;
    List<PieVO> pieList;

}
