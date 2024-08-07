<template>
    <div>
        <h1>文章数据总览</h1>
        <div>
            <el-row :gutter="20">
                <el-col :span="6">
                        <el-statistic title="文章总数量">
                            <template slot="formatter">
                                {{totalSize}}
                            </template>
                        </el-statistic>
                </el-col>
                <el-col :span="6">
                    <el-statistic title="分类总数量">
                        <template slot="formatter">
                            {{totalSize}}
                        </template>
                    </el-statistic>
            </el-col>
            <el-col :span="6">
                <el-statistic title="本月新增文章">
                    <template slot="formatter">
                        {{totalSize}}
                    </template>
                </el-statistic>
        </el-col>
        <el-col :span="6">
            <el-statistic title="本月新增点赞">
                <template slot="formatter">
                    {{totalSize}}
                </template>
            </el-statistic>
    </el-col>
            </el-row>
        </div>
        <div class="echart" id="mychart" style="width: 600px;height: 400px;"></div>
    </div>

</template>

<script>
    import * as echarts from "echarts";
    export default {

        data() {
            return {
                password: '381023',
                xData: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], //横坐标
                yData: [23, 24, 18, 25, 27, 28, 25], //数据
                
                totalSize:200
               
            }
        },
        mounted() {
            this.initEcharts();

        },
        methods: {

            initEcharts() {
                // 基本柱状图
                const option = {
                    xAxis: {
                        data: this.xData
                    },
                    yAxis: {},
                    series: [
                        {
                            type: "bar", //形状为柱状图
                            data: this.yData
                        }
                    ]
                };
                const myChart = echarts.init(document.getElementById("mychart"));
                myChart.setOption(option);
                //随着屏幕大小调节图表
                window.addEventListener("resize", () => {
                    myChart.resize();
                });
            }
        }
    }
</script>

<style lang="scss">
    
</style>