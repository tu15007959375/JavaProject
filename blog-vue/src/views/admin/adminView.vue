<template>
    <div style="height: 100%;">
        <el-container>

            <el-header style="height: 90px;margin-top: 20px;">
                <el-row>
                    <el-col :span="1">
                        <el-image
                            style="width: 50px; height: 50px;border-radius: 50%;margin-top: 5px;margin-left: 10px;"
                            :src="require('@/assets/avatar.png')"></el-image>
                    </el-col>
                    <el-col :span="2">
                        <el-image style="width: 100px;margin-top: 20px;" :src="require('@/assets/tutu.png')"></el-image>
                    </el-col>
                    <el-col :span="18">
                        <h1 style="text-align: center;padding: 0%;font-size: 35px;margin: auto;">
                            mblog后台管理系统
                            
                        </h1>
                    </el-col>
                    <el-col :span="1">
                        <el-button type="text" style="color: black;float:right;font-size: 15px;"
                            @click="jumpIndex">首页</el-button>
                    </el-col>
                    <el-col :span="1">
                        <el-button type="text" style="color: black;float:right;font-size: 15px;"
                            @click="jumpOut">登出</el-button>
                    </el-col>

                </el-row>
                <hr class="hr-space-square">

            </el-header>

            <el-container>

                <el-aside width="200px">
                    <el-menu @select="handleSelect" class="adminmenu">
                        <el-menu-item index="0">
                            <span slot="title">数据总览</span>
                        </el-menu-item>
                        <el-menu-item index="1">
                            <span slot="title">文章管理</span>
                        </el-menu-item>
                        <el-menu-item index="2">
                            <span slot="title">添加文章</span>
                        </el-menu-item>
                        <el-menu-item index="3">
                            <span slot="title">分类管理</span>
                        </el-menu-item>
                        <el-menu-item index="4">
                            <span slot="title">备忘管理</span>
                        </el-menu-item>
                    </el-menu>
                </el-aside>
                <el-main style="margin-top: 0px;padding: 0px;">

                    <!-- <el-image style="margin:0;border:0;padding:0;"  :src="require('@/assets/background.png')"></el-image> -->
                    <router-view style="margin:0;border:0;padding:0;" :key="$route.fullPath"></router-view>
                </el-main>

            </el-container>
        </el-container>
    </div>
</template>

<script>
    export default {

        data() {
            return {
            }
        },
        mounted() {
        },
        methods: {
            handleSelect(key) {
                let list = ['admin', 'articleAd', 'addArticle', 'categoryAd', 'memoAd']
                // console.log(key);
                this.$router.push({ name: list[key] })
            },
            jumpOut() {
                window.localStorage.removeItem("userInfo")
                this.$message.success("登出成功！")
                // this.$store.commit('setIsLogin', false)
                this.$router.push("/")

            },
            jumpIndex(){
                this.$router.push("/")
            }
        }
    }
</script>

<style scoped>
    html,
    body,
    #app,
    .el-container {
        padding: 0px;
        margin: 0px;
        height: 100%;
    }

    .el-aside {
        height: 100%;
        text-align: center;
        line-height: 200px;
    }

    .el-main {
        height: 100%;
        text-align: center;
        line-height: normal;
        color: black;
        /* margin-top: 20px; */
    }

    body>.el-container {
        margin-bottom: 40px;
    }

    h1 {
        /* font-size: 2em; */
        margin-block-start: 0.67em;
        margin-block-end: 0.67em;
    }

    .el-container:nth-child(5) .el-aside,
    .el-container:nth-child(6) .el-aside {
        line-height: 260px;
    }

    .el-container:nth-child(7) .el-aside {
        line-height: 320px;
    }

    .el-aside::-webkit-scrollbar {
        display: none;
    }

    .hr-space-square::before,
    .hr-space-square::after {
        content: '';
        display: block;
        width: .75em;
        height: .75em;
        transform: rotate(45deg);
        box-sizing: border-box;
        border: 1px solid;
        margin: 3px;
    }

    .hr-space-square {
        border: 0;
        color: #d0d0d5;
        background: linear-gradient(currentColor, currentColor) no-repeat center;
        background-size: calc(100% - 1.5em - 6px) 1px;
        display: flex;
        justify-content: space-between;
        margin-bottom: 0px;
    }
</style>