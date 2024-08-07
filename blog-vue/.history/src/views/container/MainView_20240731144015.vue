<template>
    <div style="margin:0;border:0;padding:0;">
        <el-image style="margin-bottom: -50px;box-shadow: 0 0 5px 1px #999;cursor: pointer;"
            :src="require('@/assets/background.png')" v-show="backgroundactive" @click="jumptucontent"></el-image>
        <div>
            <div class="info">
                <el-card>
                    <el-image style="width: 170px; height: 170px;border-radius: 50%;margin-top: 10px;"
                        :src="require('@/assets/avatar.png')"></el-image>
                    <div style="line-height: 0px;margin-top: -50px;margin-left: 20px;">
                        <el-image class="icon1" title="Email" :src="require('@/assets/icon/email.png')"
                            @click.native="jumpemail"></el-image>
                        <el-image class="icon1" title="QQ" :src="require('@/assets/icon/QQ.png')"
                            @click.native="jumpqq"></el-image>
                        <el-image class="icon1" title="GitHub" :src="require('@/assets/icon/github-fill.png')"
                            @click.native="jumpgithub"></el-image>
                        <el-image class="icon1" title="CSDN" :src="require('@/assets/icon/csdn.png')"
                            @click.native="jumpcsdn"></el-image>
                    </div>
                    <el-image style="width: 100px;margin: auto;line-height: 70px;"
                        :src="require('@/assets/tutu.png')"></el-image>
                    <p style="margin: auto;line-height: 0;margin-top: -100px;height: 50px;font-size: 13px;">吾将上下而求索</p>
                    <!--展示个人信息下的分类信息-->
                    <el-tree style="line-height: normal;margin-top: -35px;" :data="navList" ref="tree"
                        :expand-on-click-node="false" :default-expand-all="true" node-key="id"
                        @node-click="handleNodeClick">
                        <template v-slot="{ node }">
                            <span v-if="isSelect(node.data.name)"
                                style="font-size: 15px;font-weight:bold;color: black;">{{ node.data.name }} ({{
                                    node.data.number }})</span>
                            <span v-else style="font-size: 15px;">{{ node.data.name }} ({{ node.data.number }})</span>
                            <!-- <span style="font-size: 15px;">{{ node.data.name }} ({{ node.data.number }})</span> -->
                        </template>
                    </el-tree>
                </el-card>
            </div>
            <div style="line-height: normal;margin-left: 12%;font-size: 17px;width: 55%;margin-top: 20px;">
                    <el-card style="text-align: left;margin-bottom: 10px;color:#999;">
                        |&nbsp;
                        <span style="cursor: pointer;" @click="selectTitle">标&nbsp;题&nbsp;名&nbsp;称</span><i class="el-icon-sort-down" ></i><i style="margin-left: -7px;" class="el-icon-sort-up"></i>
                        &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                        <span style="cursor: pointer;">文&nbsp;章&nbsp;简&nbsp;介</span><i class="el-icon-sort-down"></i><i style="margin-left: -7px;" class="el-icon-sort-up"></i>
                        &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                        <span style="cursor: pointer;">发&nbsp;布&nbsp;日&nbsp;期</span><i style="color: black" class="el-icon-sort-down"></i><i style="margin-left: -7px;" class="el-icon-sort-up"></i>
                        &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                        <span style="cursor: pointer;">更&nbsp;新&nbsp;日&nbsp;期</span><i class="el-icon-sort-down"></i><i style="margin-left: -7px;" class="el-icon-sort-up"></i>
                        &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            
                        <span style="cursor: pointer;">访&nbsp;问&nbsp;量</span><i class="el-icon-sort-down"></i><i style="margin-left: -7px;" class="el-icon-sort-up"></i>
                        &nbsp;|
                    </el-card>
                                    
                <hr class="hr-space-square">
            </div>



            <el-card class="box-card-main" id="content" v-for="article in articleList" :key="article.id">
                <el-button type="text" class="articleBt">
                    <h2 style="line-height: 30%;"
                        @click="getArticleContextByTitle(article.title, article.categoryName)">{{
                            article.title }}</h2>
                </el-button><br>
                <i class="el-icon-s-order"></i><span style="font-size: 16px;">&nbsp;&nbsp;文章简介：{{ article.intro |
                    truncate(15) }}
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <div style="float: right;">
                    <i class="el-icon-date"></i><span>&nbsp;&nbsp;{{
                        article.createTime.split('T')[0] }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

                    <i class="el-icon-folder-opened"></i><span style="display:inline-block;width: 95px;">&nbsp;&nbsp;{{
                        article.categoryName }}</span>
                    <i class="el-icon-view"></i><span>&nbsp;&nbsp;{{
                            article.pageView }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </div>
            </el-card>
            <el-pagination style="margin-left: -22%;margin-top: 3%;line-height: normal;" @size-change="handleSizeChange"
                @current-change="handleCurrentChange" :current-page="currentPage" :page-sizes="[5, 10, 20, 30]"
                :page-size="5" layout="total, sizes, prev, pager, next, jumper" :total="totalSize">
            </el-pagination>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    components: {

    },
    data() {
        return {
            articleList: [],
            categoryId: -1,
            currentPage: 1,
            pageSize: 5,
            totalSize: -1,
            backgroundactive: 1,
            navList: [],
            isSearch: false,
            password: '381023',
            nowSelect:2,
        }
    },
    computed: {
        searchValue: {
            get() {
                return this.$store.state.searchValue
            },
            set(val) {
                this.$store.state.searchValue = val
            }
        }
    },
    watch: {
        searchValue() {
            this.isSearch = true
            this.searchValue = this.$store.state.searchValue
            console.log("搜索值发生变化，值为:", this.searchValue)

            if (this.searchValue != '') {
                this.backgroundactive = false
                this.sendSearchRequest(this.searchValue)

            } else {
                this.backgroundactive = true
                this.isSearch = false
                this.getAllArticlesByCategoryNameAndPage(-1, -1)
            }
        }
    },
    created() {
        console.log('mainview')
        this.init()
        this.$store.state.categoryName = this.$route.params.categoryName
        this.getAllArticlesByCategoryNameAndPage(-1, -1)

    },
    methods: {
        isSelect(name) {
            return this.$store.state.categoryName == name //这是通过getters来获取 在getters中做了些操作
        },
        handleSizeChange(val) {
            this.pageSize = val
            if (this.isSearch) {
                this.sendSearchRequest(this.searchValue)
            } else {
                this.getAllArticlesByCategoryNameAndPage(this.pageSize, this.currentPage)
            }
            
        },
        handleCurrentChange(val) {
            this.currentPage = val
            document.documentElement.scrollTop = 0;
            if (this.isSearch) {
                this.sendSearchRequest(this.searchValue)
            } else {
                this.getAllArticlesByCategoryNameAndPage(this.pageSize, this.currentPage)
            }
        },

        handleNodeClick(data) {
            // console.log(data.id); // 打印点击节点的 ID
            // console.log(data.name)
            this.$store.commit('setCategoryId', data.id)
            this.$store.commit('setCategoryName', data.name)
            // console.log('进入分类',key[1]);
            this.isSearch = false
            this.$router.push({ path: `/${data.name}`, })
        },
        sendSearchRequest(searchValue) {
            axios({
                url: `/api/user/article/search/${searchValue}?pageSize=${this.pageSize}&currentPage=${this.currentPage}`,
                method: 'get',
            }).then(res => {
                if (res.data.code == 1) {
                    console.log("大小为", res.data.data.total)
                    this.totalSize = res.data.data.total
                    this.articleList = res.data.data.records
                }
            })
        },
        init() {
            axios({
                url: '/api/user/category/init',
                method: 'get',
            }).then(res => {
                if (res.data.code == 1) {
                    this.navList = res.data.data
                }

            })
        },
        jumptucontent() {
            document.getElementById("content").scrollIntoView({ behavior: 'smooth' });
        },
        getAllArticlesByCategoryNameAndPage(pageSize, currentPage) {
            const name = this.$store.state.categoryName
            const categoryId = this.$store.state.categoryId
            var urls = '/api/user/article/list/'
            if (name != '' && name != null && (categoryId != -1 || this.$route.params.categoryName != '')) {
                // console.log('不为空');
                this.backgroundactive = 0
                urls += name
            }
            if (pageSize != -1 && currentPage != -1) {
                this.backgroundactive = 0
                urls += `?pageSize=${pageSize}&currentPage=${currentPage}`
            }
            console.log('发出get请求', urls)
            axios({
                url: urls,
                method: 'get',
            }).then(res => {
                if (res.data.code == 1) {
                    this.totalSize = res.data.data.total
                    this.articleList = res.data.data.records
                }
            })
        },
        getArticleContextByTitle(title, categoryName) {
            if (categoryName == '个人总结') {
                this.$prompt('请输入密码', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    inputValidator: (value) => {
                        return this.password == value;
                    },
                    inputType: 'password',
                    inputErrorMessage: ' ',
                    lockScroll: false
                }).then(() => {
                    this.$message({
                        type: 'success',
                        message: '验证成功'
                    });
                    this.backgroundactive = 0
                    this.$router.push({
                        path: `/${categoryName}/${title}`,
                    })

                }).catch(() => {
                    this.$message({
                        type: 'error',
                        message: '密码验证失败'
                    });
                });
            } else {
                this.backgroundactive = 0
                this.$router.push({
                    path: `/${categoryName}/${title}`,
                })
            }


            console.log(title)
        },
        jumpemail() {
            window.open('mailto:1804694379@qq.com')
        },
        jumpcsdn() {
            window.open('https://blog.csdn.net/qq_43713798?spm=1000.2115.3001.5343')
        },
        jumpgithub() {
            window.open('https://github.com/tu15007959375')
        },
        jumpqq() {
            //todo
            window.open('tencent://message/?uin=1804694379&Site=&Menu=yes')
        },
        selectTitle(){
            if(this.nowSelect != 0){
                var icondown = document.getElementsByClassName('el-icon-sort-down')
                icondown[this.nowSelect].style.color = '#99'
                icondown[0].style.color = 'black'
                
            }else{
                document.getElementsByClassName('el-icon-sort-up')[0].style.color = 'black'
            }
            this.nowSelect = 0;
        }
    },
    filters: {
        truncate(value, maxLength) {
            if (value.length > maxLength) {
                return value.substring(0, maxLength) + "...";
            } else {
                return value;
            }
        }
    }
}
</script>

<style>
.info {
    position: absolute;
    float: right;
    right: 12%;
    width: 250px;
    height: 350px;
}

.icon1 {
    width: 30px;
    height: 30px;
    margin-right: 17px;
    cursor: pointer;
}

.maxlen {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    /*超出部分用...代替*/
}

.articleBt,
.articleBt:active,
.articleBt:focus {
    color: #000000;
}

.articleBt:hover {
    color: #000000;
    text-decoration: underline;
}

.box-card-main {
    margin-left: 12%;
    width: 55%;
    font-size: 14px;
    line-height: 60px;
    margin-top: 10px;
    text-align: left;
    padding: 0%;
}

.clearfix:before,
.clearfix:after {
    display: table;
    content: "";
}

.clearfix:after {
    clear: both
}
.hr-space-square {
    border: 0;
    color: #d0d0d5;
    background: linear-gradient(currentColor, currentColor) no-repeat center;
    background-size: calc(100% - 1.5em - 6px) 1px;
    display: flex;
    justify-content: space-between;
}
 .hr-space-square::before,
.hr-space-square::after {
    content: '';
    display: block;
    width: .75em; height: .75em;
    transform: rotate(45deg);
    box-sizing: border-box;
    border: 1px solid;
    margin: 3px;
}
.el-icon-sort-up,
.el-icon-sort-down{
    font-weight: bolder;
}
</style>