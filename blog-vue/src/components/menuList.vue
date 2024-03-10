<template>
  <div >
    <!-- <el-menu mode="horizontal" icon="false"  class="el-menu" text-color="inherit" @select="handleSelect" > -->
      <template v-for="(item) in menuList"  >
        <el-submenu v-if="item.children && item.children.length > 0" :key="item.id + ''" :index="item.id+','+item.name" >
          <template slot="title">
            <span> {{ item.name }}</span>
          </template>
          <menu-sun :menuList="item.children" />
        </el-submenu>
        <el-menu-item v-else :key="item.id + ''" :index="item.id+','+item.name">
            {{ item.name }}
        </el-menu-item>
      </template>
    <!-- </el-menu> -->
  </div>
</template>

<script>
import MenuSun from "@/components/menuList.vue";
export default {
  name: "MenuSun",//必须要 递归组件的关键
  components: {
    MenuSun
  },
  props: {
    menuList: {}
  },
  data() {
    return {

    };
  },
  methods: {
  },

};
</script>
<style>
.el-menu--collapse .el-menu .el-submenu,
.el-menu--popup {
  min-width: 120px !important;
}

</style>