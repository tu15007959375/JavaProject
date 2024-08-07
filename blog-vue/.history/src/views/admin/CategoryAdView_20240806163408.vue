<template>
    <div>
        <h1 style="color: black;">分类管理</h1>
        <div style="margin: auto;width: 50%">
            <div style="float: right;">
                <el-button @click="handleAddCategory" style="margin-bottom: 10px;">添加</el-button>
            </div>

            <el-table :data="categoryList" :key="certinfokey" height="400" border style="width: 100%"
                :header-cell-style="{textAlign: 'center',height: '50px',}">
                <el-table-column prop="id" label="ID" width="50">
                </el-table-column>
                <el-table-column prop="name" label="分类名" width="100">
                </el-table-column>
                <el-table-column prop="parentId" label="父ID" width="100" :show-overflow-tooltip="true">

                </el-table-column>
                <el-table-column prop="level" label="分类层级" width="100">
                </el-table-column>
                <el-table-column prop="number" label="文章数量" width="100">
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                        <el-button size="mini" type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <!--修改分类dialog-->
            <el-dialog title="修改分类" :visible.sync="dialogFormVisible"
                style="line-height: normal;width: 700px;margin: auto;text-align: center;">
                <el-form :model="form" label-width="auto" size="mini" style="text-align: left;">
                    <el-form-item label="ID">
                        <span>{{ form.id }}</span>
                    </el-form-item>
                    <el-form-item label="分类名">
                        <span>{{ form.name }}</span>
                    </el-form-item>
                    <!-- <el-form-item label="分类名" required>
                        
                        <el-select v-model="form.name" placeholder="请选择分类">
                            <el-option v-for="item in categoryNameList" :key="item" :label="item" :value="item">
                            </el-option>
                        </el-select>
                    </el-form-item> -->
                    <el-form-item label="父ID" required>
                        <el-input v-model="form.parentId" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="父类层级" required>
                        <el-input v-model="form.level" autocomplete="off"></el-input>
                    </el-form-item>

                </el-form>
                <div slot="footer" style="text-align: center;">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <el-button type="primary" @click="updateCategory">确 定</el-button>
                </div>
            </el-dialog>

            <!--添加分类dialog-->
            <el-dialog title="添加分类" :visible.sync="dialogFormVisible2"
                style="line-height: normal;width: 700px;margin: auto;text-align: center;">
                <el-form :model="form2" label-width="auto" size="mini" style="text-align: left;">
                    <el-form-item label="分类名">
                        <el-input v-model="form2.name" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="父ID" required>
                        <el-input v-model="form2.parentId" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="分类层级" required>
                        <el-input v-model="form2.level" autocomplete="off"></el-input>
                    </el-form-item>

                </el-form>
                <div slot="footer" style="text-align: center;">
                    <el-button @click="dialogFormVisible2 = false">取 消</el-button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <el-button type="primary" @click="addCategory">确 定</el-button>
                </div>
            </el-dialog>
        </div>

    </div>
</template>

<script>
    import axios from 'axios'
    export default {

        data() {
            return {
                categoryList: [],
                certinfokey: true,
                dialogFormVisible: false,
                dialogFormVisible2: false,
                categoryNameList: [],
                form: {
                    id: '',
                    name: '',
                    parentId: '',
                    level: '',
                    number:'',
                },
                form2: {
                    name: '',
                    parentId: '',
                    level: '',
                },
            }
        },
        created() {
            console.log('获取全部分类信息');
            this.getCategoryList()

        },
        methods: {
            updateCategory() {
                axios({
                    url: `/api/admin/category`,
                    method: 'put',
                    data: {
                        id: parseInt(this.form.id),
                        name: this.form.name,
                        parentId: parseInt(this.form.parentId),
                        level: parseInt(this.form.level)
                    }
                }).then(res => {
                    if (res.data.code == 1) {
                        this.$message.success('修改成功')
                        this.getCategoryList()
                    } else {
                        this.$message.error(res.data.msg)
                    }
                })
                this.dialogFormVisible = false
            },
            addCategory() {
                axios({
                    url: `/api/admin/category`,
                    method: 'post',
                    data: {
                        name:this.form2.name,
                        parentId:parseInt(this.form2.parentId),
                        level:parseInt(this.form2.level)
                    }
                }).then(res => {
                    if (res.data.code == 1) {
                        this.$message.success('保存成功')
                        this.dialogFormVisible2 = false
                    }
                })
            },
            handleAddCategory() {
                this.dialogFormVisible2 = true
            },
            handleEdit(index, row) {
                console.log(index, row);
                this.dialogFormVisible = true
                this.form.id = row.id + ''
                this.form.name = row.name
                this.form.parentId = row.parentId
                this.form.level = row.level
            },
            handleDelete(index, row) {
                console.log(index, row);
                this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    console.log('删除id:', row.id);
                    axios.delete('/api/admin/category', {
                        params: {
                            id: row.id,
                        }
                    }).then(res => {
                        if (res.data.code == 1) {
                            this.$message({
                                type: 'success',
                                message: '删除成功!',
                            });
                            this.categoryList.splice(index, 1);
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
            getCategoryList() {
                axios({
                    url: '/api/admin/category/list',
                    method: 'get',
                }).then(res => {
                    if (res.data.code == 1) {
                        this.categoryList = res.data.data
                        this.certinfokey = !this.certinfokey
                        this.categoryNameList = this.categoryList.map(category => category.name);
                    }
                })
            }
        }
    }
</script>

<style>
</style>