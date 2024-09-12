<template>
    <div>
        <div style="margin: 0 20px;">
            <el-row :gutter="24">
                <el-col :span="6">
                    <el-statistic title="总文章数">
                        <template slot="formatter">
                            {{baseInfo.articleNums}}
                        </template>
                    </el-statistic>
                </el-col>
                <el-col :span="6">
                    <el-statistic title="总分类数">
                        <template slot="formatter">
                            {{baseInfo.categoryNums}}
                        </template>
                    </el-statistic>
                </el-col>
                <el-col :span="6">
                    <el-statistic title="总点赞数">
                        <template slot="formatter">
                            {{baseInfo.likeNums}}
                        </template>
                    </el-statistic>
                </el-col>
                <el-col :span="6">
                    <el-statistic title="总访问量">
                        <template slot="formatter">
                            {{baseInfo.pageViewNums}}
                        </template>
                    </el-statistic>
                </el-col>
            </el-row>

            <el-row :gutter="24">
                <el-col :span="6">
                    <el-statistic title="月增文章">
                        <template slot="formatter">
                            {{baseInfo.articleMonthNums}}
                        </template>
                    </el-statistic>
                </el-col>
                <el-col :span="6">
                    <el-statistic title="月增点赞">
                        <template slot="formatter">
                            {{baseInfo.likeMonthNums}}
                        </template>
                    </el-statistic>
                </el-col>
                <el-col :span="6">
                    <el-statistic title="月增访问">
                        <template slot="formatter">
                            {{baseInfo.pageViewMonthNums}}
                        </template>
                    </el-statistic>
                </el-col>
            </el-row>
        </div>
        <div class="chartDatepicker">
            选择日期范围：
            <el-date-picker v-model="beginendTime" type="daterange" range-separator="-" start-placeholder="开始日期"
                unlink-panels end-placeholder="结束日期" format="yyyy 年 MM 月 dd 日" value-format="yyyy-MM-dd"
                @change="choseTime">

            </el-date-picker>
        </div>
        <div class="echart" id="mychart" style="width: 50%;height: 420px;float: left;"></div>
        <div class="echartPie" id="mychartPie" style="width: 50%;height: 400px;float: left;margin-top: -35px;"></div>
    </div>

</template>

<script>
    import * as echarts from "echarts";
    import moment from 'moment';
    export default {

        data() {
            return {
                xData: [], //横坐标
                yData: [], //数据
                mychart: null,
                option: null,
                mychartPie:null,
                baseInfo: [],
                beginendTime: '',
                pieData: [],
                pieName: [],
            }
        },
        mounted() {
            this.authToken()
            this.defaultDate();
            this.choseTime()
            this.initBaseInfo()
        },
        methods: {
            authToken(){
                const token = JSON.parse(window.localStorage.getItem("userInfo")).token
                this.$axios({
                    url: `/api/user/auth`,
                    method: 'get',
                    Headers:{
                        'Authorization':token
                    }
                }).then(res => {
                    if (res.data.code != 1) {
                        this.$message.error("token令牌无效或过期，请重新登录!")
                        window.localStorage.removeItem("userInfo")
                        this.$router.push("/")
                    }
                })
            },
            initEcharts() {
                // 基本柱状图
                this.option = {
                    xAxis: {
                        data: this.xData
                    },
                    yAxis: {
                        name: '文章数量',
                        minInterval: 1,
                    },
                    series: [
                        {
                            type: "bar", //形状为柱状图
                            data: this.yData,
                            itemStyle: {
                                color: '#F0F8FF',
                                borderRadius: 5,
                                borderWidth: 1,
                                borderType: 'solid',
                                borderColor: '#B0E0E6',
                                shadowColor: '#000080',
                                shadowBlur: 3
                            }
                        },

                    ]
                };
                this.mychart = echarts.init(document.getElementById("mychart"));

                this.mychart.setOption(this.option, true);
                //随着屏幕大小调节图表
                window.addEventListener("resize", () => {
                    this.mychart.resize();
                });

            },
            choseTime() {
                if (this.mychart != null && this.mychart != "" && this.mychart != undefined) {
                    this.mychart.dispose();//销毁
                }
                // console.log(this.beginendTime);
                var url = '/api/user/article/dateList?beginTime=' + this.beginendTime[0] + '&endTime=' + this.beginendTime[1]
                this.$axios({
                    url: url,
                    method: 'get',
                }).then(res => {
                    if (res.data.code == 1) {
                        console.log('更新xy轴');
                        // console.log(res.data.data);
                        this.yData = []
                        this.xData = []
                        this.yData = res.data.data
                        var tempdate = this.beginendTime[0]
                        while (moment(tempdate).isBefore(this.beginendTime[1])) {
                            this.xData.push(tempdate)
                            tempdate = moment(tempdate).add(1, 'months').format('YYYY-MM-DD')
                        }
                        this.initEcharts()
                        // console.log(this.option);
                        // this.mychart.setOption(this.option,{notMerge:true});
                        // this.mychart.setOption(this.option,true)
                    } else {
                        this.$message.error(res.data.msg)
                    }
                })
            },
            async initBaseInfo() {
                await this.$axios({
                    url: '/api/user/article/baseInfo',
                    method: 'get',
                }).then(res => {
                    if (res.data.code == 1) {
                        this.baseInfo = res.data.data
                        this.pieData = this.baseInfo.pieList
                    } else {
                        this.$message.error(res.data.msg)
                    }
                })
                for (let i = 0; i < this.pieData.length; i++) {
                    // this.xData[i] = i;
                    // this.yData =this.xData[i]*this.xData[i];
                    this.pieName[i] = this.pieData[i].name;
                }
                var option = {
                    legend: {
                        // 图例
                        data: this.pieName,
                        // right: "10%",
                        // top: "30%",
                        // orient: "vertical"
                        y:'bottom'
                    },
                    title: {
                        // 设置饼图标题，位置设为顶部居中
                        text: "各分类文章总数",
                        top: "0%",
                        left: "center"
                    },
                    series: [
                        {
                            type: "pie",
                            label: {
                                show: true,
                                formatter: "{b} : {c} ({d}%)" // b代表名称，c代表对应值，d代表百分比
                            },
                            radius: "40%", //饼图半径
                            data: this.pieData
                        }
                    ]
                };
                console.log(this.seriesData);
                this.mychartPie = echarts.init(document.getElementById("mychartPie"));
                this.mychartPie.setOption(option);
                //随着屏幕大小调节图表
                window.addEventListener("resize", () => {
                    this.mychartPie.resize();
                });
            },
            //设置默认日期
            defaultDate() {
                //获取新的时间
                let date = new Date()
                //获取当前时间的年份转为字符串
                let year = date.getFullYear().toString()
                //获取月份，由于月份从0开始，此处要加1，判断是否小于10，如果是在字符串前面拼接'0'
                let month = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1).toString() : (date.getMonth() + 1).toString()
                //获取天，判断是否小于10，如果是在字符串前面拼接'0'
                let da = date.getDate() < 10 ? '0' + date.getDate().toString() : date.getDate().toString()
                //字符串拼接，开始时间，结束时间
                let end = year + '-' + month + '-' + da  //当天
                let beg = year + '-' + month + '-01'    //当月第一天
                this.beginendTime = [beg, end] //将值设置给插件绑定的数据
            },

        }
    }
</script>

<style scoped>
    .chartDatepicker {
        text-align: center;
        width: 500px;
        margin-left: 50px;
        margin-top: 30px;
    }
</style>