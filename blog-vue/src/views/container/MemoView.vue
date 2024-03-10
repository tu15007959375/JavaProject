<template>
    <div>
        <el-calendar class="calendar1">
            <div slot="dateCell" slot-scope="{ data }" @click="viewDayWork(data)"
                style="height: 70px;width: 97px;border-spacing:0px">
                <br>
                <p>
                    {{ data.day.split("-").slice(2).join() }}
                </p>
            </div>
        </el-calendar>
        <el-card class="box-card-memo">
            <h2>To Do List</h2>
            {{ this.date }}
            <br>
            <br>
            <el-button type="primary" size="mini" style="float: right;margin-right: 4%;" @click="showaddform">新增</el-button>
            <el-button type="primary" size="mini" style="float: right;margin-right: 6%;" @click="verifyPassword">验证密码</el-button>
            <el-table :data="memoList" style="width: 100%">
                <el-table-column label="内容" width="160px">
                    
                    <template slot-scope="scope">
                        
                        <!-- <span>{{ scope.row.name }}</span> -->
                        <i v-if="scope.row.tag==0" style="width:5px;height:5px;border-radius:50%;background-color:red;display: block;float: left;margin-top:10px;margin-left: -10px;"></i>
                        <i v-else-if="scope.row.tag==1" style="width:5px;height:5px;border-radius:50%;background-color:green;display: block;float: left;margin-top:10px;margin-left: -10px;"></i>
                        <i v-else style="width:5px;height:5px;border-radius:50%;background-color:grey;display: block;float: left;margin-top:10px;margin-left: -10px;"></i>
                        <span>{{ scope.row.name }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="时间" width="80px">
                    <template slot-scope="scope">
                        <!-- <span>{{ scope.row.name }}</span> -->
                        <span>{{ scope.row.date.split('T')[1] }}</span>
                    </template>
                </el-table-column>
                <el-table-column width="60px">
                    <template slot-scope="scope">
                        <el-switch v-model="scope.row.status" :active-value="1" :inactive-value="0"
                            @change="switchStatus($event, scope.row)"></el-switch>
                    </template>

                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-card>
        <!--添加备忘dialog-->
        <el-dialog title="添加备忘" :visible.sync="dialogFormVisible" style="line-height: normal;width: 700px;margin: auto;">
            <el-form :model="form" label-width="auto" size="mini">
                <el-form-item label="备忘内容" required>
                    <el-input v-model="form.name" autocomplete="off"></el-input>
                </el-form-item>
                <br>
                <el-form-item label="重要程度" required>
                    <el-select v-model="form.tag" placeholder="请选择重要程度" style="width: 100%;">
                        <el-option label="非常重要" value="0"></el-option>
                        <el-option label="重要" value="1"></el-option>
                        <el-option label="一般" value="2"></el-option>
                    </el-select>
                </el-form-item>
                <br>
                <el-form-item label="日程时间" required>
                    <el-date-picker type="datetime" placeholder="选择日期时间" v-model="form.date" format="yyyy-MM-dd HH:mm:ss"
                        value-format="yyyy-MM-dd HH:mm:ss" style="width: 100%;"></el-date-picker>
                </el-form-item>
            </el-form>
            <div slot="footer" style="text-align: center;">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <el-button type="primary" @click="submitmemo">确 定</el-button>
            </div>
        </el-dialog>

        <!--编辑备忘dialog-->
        <el-dialog title="编辑备忘" :visible.sync="dialogFormVisible2" style="line-height: normal;width: 700px;margin: auto;">
            <el-form :model="form2" label-width="auto" size="mini">
                <el-form-item label="备忘录ID">
                    <span>{{ form2.id }}</span>
                </el-form-item>
                <el-form-item label="备忘内容" required>
                    <el-input v-model="form2.name" autocomplete="off"></el-input>
                </el-form-item>
                <br>
                <el-form-item label="重要程度" required>
                    <el-select v-model="form2.tag" placeholder="请选择重要程度" style="width: 100%;">
                        <el-option label="非常重要" value="0"></el-option>
                        <el-option label="重要" value="1"></el-option>
                        <el-option label="一般" value="2"></el-option>
                    </el-select>
                </el-form-item>
                <br>
                <el-form-item label="日程时间" required>
                    <el-date-picker type="datetime" placeholder="选择日期时间" v-model="form2.date" format="yyyy-MM-dd HH:mm:ss"
                        value-format="yyyy-MM-dd HH:mm:ss" style="width: 100%;"></el-date-picker>
                </el-form-item>
                <el-form-item label="是否完成" required>
                    <el-select v-model="form2.status" placeholder="是否完成" style="width: 100%;">
                        <el-option label="完成" value="1"></el-option>
                        <el-option label="未完成" value="0"></el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <div slot="footer" style="text-align: center;">
                <el-button @click="dialogFormVisible2 = false">取 消</el-button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <el-button type="primary" @click="updatememo">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>
  
<script>
import axios from 'axios'
export default {
    data() {
        return {
            memoList: [],
            date: '',
            password: '381023',
            dialogFormVisible: false,
            dialogFormVisible2: false,
            form: {
                name: '',
                date: '',
                tag: '',
                status:'',
            },
            passwordFlag:false,
            form2: {
                id: '',
                name: '',
                tag: '',
                status: '',
                date:''
            },
        };
    },
    created() {
        this.initMemo()
    },
    methods: {
        //插入memo
        submitmemo() {
            console.log(this.form)
            let formdate = this.form.date
            if (this.form.date.length == 10) {
                console.log('填充date')
                formdate += ' 08:00:00'
            }
            axios({
                url: `/api/admin/memo`,
                method: 'post',
                data: {
                    name: this.form.name,
                    date: formdate,
                    tag: parseInt(this.form.tag),
                    status: 0
                }
            }).then(res => {
                if (res.data.code == 1) {
                    this.$message.success('插入成功')
                    this.sendRequestSetMemoList(this.date)
                    for (let key in this.form) {
                        delete this.form[key];
                    }
                } else {
                    this.$message.error('插入错误!')
                }
            })
            this.dialogFormVisible = false
        },
        //点击编辑更新memo
        updatememo() {
            axios({
                url: `/api/admin/memo`,
                method: 'put',
                data: {
                    id: parseInt(this.form2.id),
                    name: this.form2.name,
                    date: this.form2.date,
                    tag: parseInt(this.form2.tag),
                    status: parseInt(this.form2.status)
                }
            }).then(res => {
                if (res.data.code == 1) {
                    this.sendRequestSetMemoList(this.date)
                    this.$message.success('修改成功')
                } else {
                    this.$message.error('修改错误!')
                }
            })
            this.dialogFormVisible2 = false
        },
        switchStatus(val, row) {
            if (this.passwordFlag) { 
                console.log(val, row)
            axios({
                url: `/api/admin/memo`,
                method: 'put',
                data: {
                    id: parseInt(row.id),
                    status: parseInt(val)
                }
            }).then(res => {
                if (res.data.code == 1) {
                    // this.memoList = res.data.data
                } else {
                    this.$message.error('修改状态错误!')
                    row.status = val == 1 ? 0 : 1
                }
            })
            } else {
                this.$message.warning('请点击验证密码按钮验证密码')
                row.status = val == 1 ? 0 : 1
            }
            

        },
        viewDayWork(data) {
            this.date = data.day
            this.sendRequestSetMemoList(this.date)
        },
        handleEdit(index, row) {
            if (this.passwordFlag) {
                console.log(index, row)
            // this.form2 = row
            // this.form2.tag += ''
                // this.form2.status += ''
            this.form2.id = row.id+''
            this.form2.name = row.name+''
            this.form2.status = row.status+''
            this.form2.tag = row.tag+''
            this.form2.date = (row.date+'').replace('T', ' ')
            console.log("form2", this.form2)
            this.dialogFormVisible2 = true
            } else {
                this.$message.warning('请点击验证密码按钮验证密码')
            }
           
        },
        handleDelete(index, row) {
            if (this.passwordFlag) { 
                console.log(index, row);
            let id = parseInt(row.id)
            axios({
                url: `/api/admin/memo?id=${id}`,
                method: 'delete',
            }).then(res => {
                if (res.data.code == 1) {
                    this.memoList = this.memoList.filter(item => item.id !== id)
                    // this.memoList = res.data.data
                    this.$message.success('删除成功')

                } else {
                    this.$message.error('删除失败！')
                }
            })
            } else {
                this.$message.warning('请点击验证密码按钮验证密码')
            }
           
        },
        showaddform() {
            if (this.passwordFlag) {
                this.form.date = this.date
                this.dialogFormVisible = true
            } else {
                this.$message.warning('请点击验证密码按钮验证密码')
            }
            
        },
        initMemo() {
            this.date = this.getCurrentDate()
            this.sendRequestSetMemoList(this.date)
        },
        sendRequestSetMemoList(date) {
            axios({
                url: `/api/admin/memo/list/${date}`,
                method: 'get',
            }).then(res => {
                if (res.data.code == 1) {
                    this.memoList = res.data.data
                }

            })
        },
        getCurrentDate() {
            let now = new Date();
            let year = now.getFullYear();
            let month = now.getMonth() + 1;
            let day = now.getDate();
            let date = '';
            if(month<10){
                date = year + "-0" + month
            }else{
                date = year + "-" + month
            }
            if (day < 10) {
                return date + "-0" + day;
            } else {
                return date + "-" + day;
            }

        },
        verifyPassword() {
            this.$prompt('请输入密码', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                inputValidator: (value) => {
                    return this.password == value;
                },
                inputType: 'password',
                inputErrorMessage: ' ',
                lockScroll:false
            }).then(() => {
                this.$message({
                    type: 'success',
                    message: '验证成功'
                });
                this.passwordFlag = true
            }).catch(() => {
                this.$message({
                    type: 'error',
                    message: '密码验证失败'
                });
            });
        }
    }
};
</script>

<style>
.box-card-memo {
    position: absolute;
    float: right;
    top: 30%;
    line-height: normal;
    right: 2%;
    width: 500px;
}

.calendar1 {
    float: left;
    line-height: normal;
    color: black;
    width: 50%;
    margin-left: 10%;
    margin-top: 2%;
    height: 40%;
}

.calendar1 .el-calendar-day {
    height: 70px;
    padding: 0px;
}
.el-message-box__errormsg {
    display: none !important;
  }
</style>