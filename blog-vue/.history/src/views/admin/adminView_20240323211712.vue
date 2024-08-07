<template>
    <div style="height: 100%;">
        <el-container>
            <el-aside width="200px">
                <el-menu @select="handleSelect">
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
            <el-main style="padding: 0">
               
                <!-- <el-image style="margin:0;border:0;padding:0;"  :src="require('@/assets/background.png')"></el-image> -->
                <router-view style="margin:0;border:0;padding:0;" :key="$route.fullPath"></router-view>
            </el-main>
            
        </el-container>
        
    </div>
</template>

<script>
    export default {

        data() {
            return {
                password: '381023',
            }
        },
        mounted() {
            // this.$prompt('请输入密码', '提示', {
            //     confirmButtonText: '确定',
            //     cancelButtonText: '取消',
            //     inputValidator: (value) => {
            //         return this.password == value;
            //     },
            //     inputType: 'password',
            //     inputErrorMessage: '密码验证失败',
            //     lockScroll: false
            // }).then(() => {
            //     this.$message({
            //         type: 'success',
            //         message: '验证成功'
            //     });

            // }).catch(() => {
            //     this.$message({
            //         type: 'error',
            //         message: '密码验证失败'
            //     });
            //     this.$router.push({
            //         path: `/`,
            //     })
            // });
        },
        methods: {
            handleSelect(key) {
                let list = ['admin', 'articleAd', 'addArticle', 'categoryAd', 'memoAd']
                // console.log(key);
                this.$router.push({ name: list[key] })
            },
        }
    }
</script>

<style>
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
</style>