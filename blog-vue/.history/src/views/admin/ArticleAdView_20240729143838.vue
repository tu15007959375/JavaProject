<template>
    <div>
        <h1 style="color: black;">文章管理</h1>
        <div>
            <div style="text-align: left;">
                <span style="margin-right: 20px;">当前文件路径：{{filePath}}</span>

                <el-button @click="handleSetFilePath">重新设置</el-button>
                <el-input v-model="searchValue" style="width: 200px;margin-left: 50px;" @keyup.enter.native="handleSearch">
                    <el-button slot="append" icon="search" @click="handleSearch">搜索</el-button>
                </el-input>
            </div>
            <el-table :data="articleList" :key="certinfokey" height="400" border style="width: 100%"
                :header-cell-style="{textAlign: 'center',height: '50px',}">
                <el-table-column prop="id" label="ID" width="50">
                </el-table-column>
                <el-table-column prop="title" label="标题" width="150">
                </el-table-column>
                <el-table-column prop="intro" label="简介" width="350" :show-overflow-tooltip="true">

                </el-table-column>
                <el-table-column label="创建时间" width="180">
                    <template slot-scope="scope">
                        {{scope.row.createTime.replace('T',' ')}}
                    </template>
                </el-table-column>
                <el-table-column label="修改时间" width="180">
                    <template slot-scope="scope">
                        {{scope.row.updateTime.replace('T',' ')}}
                    </template>
                </el-table-column>
                <el-table-column prop="categoryName" label="类别" width="100">
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                        <el-button size="mini" type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                        <el-button size="mini" @click="handleView(scope.$index, scope.row)">查看</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <!--编辑文章dialog-->
            <el-dialog title="修改文章" :visible.sync="dialogFormVisible"
                style="line-height: normal;width: 700px;margin: auto;text-align: center;">
                <el-form :model="form" label-width="auto" size="mini" style="text-align: left;">
                    <el-form-item label="文章ID">
                        <span>{{ form.id }}</span>
                    </el-form-item>
                    <el-form-item label="文章名" required>
                        <el-input v-model="form.title" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="文章介绍" required>
                        <el-input v-model="form.intro" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="分类" required>
                        <!-- <el-input v-model="form.categoryName" autocomplete="off"></el-input> -->
                        <el-select v-model="form.categoryName" placeholder="请选择分类">
                            <el-option v-for="item in categoryNameList" :key="item" :label="item" :value="item">
                            </el-option>
                        </el-select>
                    </el-form-item>

                </el-form>
                <div slot="footer" style="text-align: center;">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <el-button type="primary" @click="updateArticle">确 定</el-button>
                </div>
            </el-dialog>
            <el-pagination style="margin-left: -22%;margin-top: 3%;" @size-change="handleSizeChange"
                @current-change="handleCurrentChange" :current-page="currentPage" :page-sizes="[20,50,100,200]"
                :page-size="20" layout="total, sizes, prev, pager, next, jumper" :total="totalSize">
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
                certinfokey: true,
                categoryNameList: [],
                currentPage: 1,
                pageSize: 20,
                totalSize: -1,
                isSearch: false,
                searchValue: '',
                filePath: '',
                dialogFormVisible: false,
                form: {
                    id: '',
                    title: '',
                    intro: '',
                    categoryName: '',
                },
            }
        },
        created() {
            this.filePath = this.$store.state.filePath
            this.getAllArticlesByCategoryNameAndPage(this.pageSize, this.currentPage)
            this.getAllCategories()
        },
        methods: {
            updateArticle() {
                if(this.form.title == null || this.form.title == ''){
                    this.$message.error('标题不能为空')
                    return
                }
                if(this.form.intro == null || this.form.intro == ''){
                    this.$message.error('介绍不能为空')
                    return
                }
                axios({
                    url: `/api/admin/article`,
                    method: 'put',
                    data: {
                        id: parseInt(this.form.id),
                        originTitle = this.form.title,
                        title: this.form.title,
                        intro: this.form.intro,
                        categoryName: this.form.categoryName,
                        filePath: this.filePath
                    }
                }).then(res => {
                    if (res.data.code == 1) {
                        this.$message.success('修改成功')
                    } else {
                        this.$message.error(res.data.msg)
                    }
                })
                this.getAllArticlesByCategoryNameAndPage(this.pageSize, this.currentPage)
                this.dialogFormVisible = false
            },
            handleSearch() {
                this.isSearch = true
                if (this.searchValue == '') {
                    this.isSearch = false
                    this.getAllArticlesByCategoryNameAndPage(this.pageSize, this.currentPage)
                } else {
                    this.sendSearchRequest(this.searchValue)
                }

            },
            handleSetFilePath() {
                this.$prompt('请输入文件路径', '提示', {
                    inputValue: this.filePath,
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                }).then(({ value }) => {
                    this.filePath = value
                    this.$store.commit('setFilePath', value)
                    this.$message({
                        type: 'success',
                        message: '你设置的路径是: ' + value,
                        duration: 500
                    });
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '取消输入',
                        duration: 500
                    });
                });
            },
            handleEdit(index, row) {
                console.log(index, row);
                this.form.id = row.id + ''
                this.form.title = row.title
                this.form.intro = row.intro
                this.form.categoryName = row.categoryName
                this.dialogFormVisible = true
            },
            handleView(index, row) {
                console.log(index, row);
                this.$router.push({
                        path: `/admin/addArticle/${row.title}`,
                    })
            },
            handleDelete(index, row) {
                this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    console.log('删除id:', row.id);
                    axios.delete('/api/admin/article', {
                        params: {
                            id: row.id,
                            filePath: this.filePath
                        }
                    }).then(res => {
                        if (res.data.code == 1) {
                            this.$message({
                                type: 'success',
                                message: '删除成功!',
                            });
                            this.articleList.splice(index, 1);
                        } else {
                            this.$message({
                                type: 'error',
                                message: res.data.msg,
                            });
                        }
                    }).catch(() => {
                        this.$message({
                            type: 'error',
                            message: '删除失败',
                        });
                    });
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });

            },
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
                if (this.isSearch) {
                    this.sendSearchRequest(this.searchValue)
                } else {
                    this.getAllArticlesByCategoryNameAndPage(this.pageSize, this.currentPage)
                }
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
            getAllArticlesByCategoryNameAndPage(pageSize, currentPage) {
                // const name = this.$store.state.categoryName
                // const categoryId = this.$store.state.categoryId
                var urls = '/api/user/article/list/'
                // if (name != '' && name != null && (categoryId != -1 || this.$route.params.categoryName != '')) {
                //     // console.log('不为空');
                //     this.backgroundactive = 0
                //     urls += name
                // }
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
                        console.log("更新文章list")
                        this.totalSize = res.data.data.total
                        this.articleList = res.data.data.records
                        this.certinfokey = !this.certinfokey
                        console.log("key", this.certinfokey);
                    }
                })

            },
            getAllCategories() {
                this.categoryNameList = this.$store.state.categoryNameList
                if (this.categoryNameList.length == 0) {
                    console.log("未从store获取到categoryNameList");
                    axios({
                        url: '/api/user/category/getAllNames',
                        method: 'get',
                    }).then(res => {
                        if (res.data.code == 1) {
                            this.categoryNameList = res.data.data
                            this.$store.commit('setCategoryNameList', this.categoryNameList)
                        }
                    })
                } else {
                    console.log("从store获取到categoryNameList");
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
        /* margin-top: 10px; */
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
</style>