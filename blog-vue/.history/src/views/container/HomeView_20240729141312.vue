<template>
  <div>
    <el-container class="container">
      <!--首部，导航栏-->
      <el-header class="menu">
        <el-row style="height: 60px;display: flex; flex-wrap: nowrap">
          <el-col :span="1">
            <el-image style="width: 50px; height: 50px;border-radius: 50%;margin-top: 5px;margin-left: 10px;"
              :src="require('@/assets/avatar.png')"></el-image>
          </el-col>
          <el-col :span="2">
            <el-image style="width: 100px;margin-top: 20px;" :src="require('@/assets/tutu.png')"></el-image>
          </el-col>

          <el-col :span="16">
            <el-menu mode="horizontal" icon="false" class="el-menu" text-color="inherit" @select="handleSelect">
              <menu-sun :menuList="menuList" />
            </el-menu>

          </el-col>
          <el-col :span="4">
            <el-input v-model="searchValue" @keyup.enter.native="handleSearch">
              <el-button slot="append" icon="search" @click="handleSearch">搜索</el-button>
            </el-input>
          </el-col>
        </el-row>
        <!--中部，页面展示-->
      </el-header>
      <el-main style="padding: 0">
        <!-- <el-image style="margin:0;border:0;padding:0;"  :src="require('@/assets/background.png')"></el-image> -->
        <router-view style="margin:0;border:0;padding:0;" :key="$route.fullPath"></router-view>
      </el-main>
      <!--尾部-->
      <el-footer>

        
        <div style="color: #fd7286;font-size: large;font-weight: bolder;width: 55%;margin-left: 12%;">
          <span id="htmer_time"></span><br>
          <a href="https://beian.miit.gov.cn" class="icp" target="_blank">赣ICP备2024025296号-1&ensp;&ensp;</a>
          <el-image :src="require('@/assets/record.png')" style="width: 17px;height: 17spx;"></el-image>
          <a href="https://beian.mps.gov.cn/#/query/webSearch?code=36098102000290" class="icp" rel="noreferrer" target="_blank">赣公网安备36098102000290</a>
        </div>

      </el-footer>
    </el-container>
  </div>
</template>

<script>
  import axios from 'axios'
  import MenuSun from "@/components/menuList.vue";



  export default {
    components: {
      MenuSun,
    },
    data() {
      return {
        activeIndex: '1',
        activeIndex2: '1',
        searchValue: '',
        menuList: [],
      }
    },
    created() {

      this.getAllCategories()
     

    },
    methods: {
      handleSearch() {
        console.log("搜索", this.searchValue) // 输出输入框的值
        this.$store.commit('setSearchValue', this.searchValue)
      },
      getAllCategories() {
        axios({
          url: '/api/user/category/init',
          method: 'get',
        }).then(res => {
          if (res.data.code == 1) {
            var list = res.data.data;
            list.unshift({ id: -2, name: "备忘录", children: [] })
            list.unshift({ id: -3, name: "导航", children: [] })
            list.unshift({ id: -4, name: "首页", children: [] })
            list.push({ id: -5, name: "云盘", children: [] })
            this.menuList = list
          }

        })
      },
      handleSelect(key) {
        this.$store.state.searchValue = ''
        this.searchValue = ''
        key = key.split(',')
        if (parseInt(key[0]) >= 0) {
          this.$store.commit('setCategoryId', parseInt(key[0]))
          this.$store.commit('setCategoryName', key[1])
          // console.log('进入分类',key[1]);
          this.$router.push({ path: `/${key[1]}`, })
        } else if (parseInt(key[0]) == -4) {
          this.$store.commit('setCategoryId', -1)
          this.$router.push({ path: `/` })
        } else if (parseInt(key[0]) == -3) {
          // console.log("进入分类");
          this.$router.push({ name: 'navigation' })
        } else if (parseInt(key[0]) == -2) {
          this.$router.push({ name: 'memo' })
        } else if (parseInt(key[0]) == -5) {
          window.open('http://tjx001.tpddns.cn:12369', "_blank")
        }

      },
    },

  }
  function secondToDate(second) {
    if (!second) {
      return 0;
    }
    var time = new Array(0, 0, 0, 0, 0);
    if (second >= 365 * 24 * 3600) {
      time[0] = parseInt(second / (365 * 24 * 3600));
      second %= 365 * 24 * 3600;
    }
    if (second >= 24 * 3600) {
      time[1] = parseInt(second / (24 * 3600));
      second %= 24 * 3600;
    }
    if (second >= 3600) {
      time[2] = parseInt(second / 3600);
      second %= 3600;
    }
    if (second >= 60) {
      time[3] = parseInt(second / 60);
      second %= 60;
    }
    if (second > 0) {
      time[4] = second;
    }
    return time;
  }
  function setTime() {
    //mouth要少一个月不然会出问题
    var create_time = Math.round(new Date(Date.UTC(2023, 11, 1, 0, 0, 0)).getTime() / 1000);
    var timestamp = Math.round((new Date().getTime() + 8 * 60 * 60 * 1000) / 1000);
    var currentTime = secondToDate((timestamp - create_time));
    var currentTimeHtml = currentTime[0] + '年' + currentTime[1] + '天'
      + currentTime[2] + '时' + currentTime[3] + '分' + currentTime[4]
      + '秒';
    if (document.getElementById("htmer_time") != null)
      document.getElementById("htmer_time").innerHTML = "荼图小站已经苟活" + currentTimeHtml;
  }
  //即时刷新
  setInterval(setTime, 1000);
</script>

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  .el-header {
    box-shadow: 0 0 5px 1px #999;
    z-index: 1;
    background-color: #ffffff;
    color: #333;
    text-align: center;
    line-height: 60px;
  }

  .el-footer {
    background-color: #ffffff;
    color: #333;
    text-align: center;
    line-height: 60px;
  }


  .el-main {
    background-color: #ffffff;
    color: #f4f4f4;
    text-align: center;
    line-height: 160px;
  }

  body>.el-container {
    margin-bottom: 40px;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }

  /* 水平样式 */
  .el-menu--horizontal>div>.el-submenu {

    float: left;
  }

  /* 一级菜单的样式 */
  .el-menu--horizontal>div>.el-menu-item {

    float: left;
    height: 60px;
    line-height: 60px;
    margin: 0;
    border-bottom: 2px solid transparent;
    color: #909399;
  }

  /* 解决下图1 下拉三角图标 */
  .el-menu--horizontal>div>.el-submenu .el-submenu__icon-arrow {

    position: static;
    vertical-align: middle;
    margin-left: 8px;
    margin-top: -3px;
  }

  /* 解决下图2 无下拉菜单时 不对齐问题 */
  .el-menu--horizontal>div>.el-submenu .el-submenu__title {

    height: 60px;
    line-height: 60px;
    border-bottom: 2px solid transparent;
    color: #909399;
  }
  .icp{
    text-decoration: none;
    color: #999;
    font-size: 15px;
  }
</style>