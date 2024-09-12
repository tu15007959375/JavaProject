<template>
  <div>
    <v-md-editor v-model="editorValue" @save="saveFile" :disabled-menus="[]" @upload-image="handleUploadImage"
      height="calc(100vh - 150px)"></v-md-editor>
    <!--添加文章dialog-->
    <el-dialog title="保存文章" :visible.sync="dialogFormVisible"
      style="line-height: normal;width: 700px;margin: auto;text-align: center;">
      <el-form :model="form" label-width="auto" size="mini" style="text-align: left;">
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
        <el-button type="primary" @click="addArticle">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  export default {
    name: 'mdEditor',
    data() {
      return {
        editorValue: this.content != null ? this.content : "",
        text: '',
        dialogFormVisible: false,
        categoryNameList: [],
        originCategoryName:'',
        form: {
          title: '',
          intro: '',
          categoryName: '',
        },
      }
    },
    props: {
      // 接收值父组件传递值
      content: String,
      title: String,
    },
    created() {
      if (this.title != null && this.title != '') {
        this.$axios({
          url: `/api/user/article/title/${this.title}`,
          method: 'get',
        }).then(res => {
          if (res.data.code == 1) {
            this.form.intro = res.data.data.intro
            this.form.categoryName = res.data.data.categoryName
            this.originCategoryName = res.data.data.categoryName
          }
        })
        this.form.title = this.title
      }

      this.categoryNameList = this.$store.state.categoryNameList
      if (this.categoryNameList.length == 0) {
        console.log("未从store获取到categoryNameList");
        this.$axios({
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

    },
    methods: {
      addArticle() {

        if (this.form.title == null || this.form.title == '') {
          this.$message.error('标题不能为空')
          return
        }
        if (this.form.intro == null || this.form.intro == '') {
          this.$message.error('介绍不能为空')
          return
        }
        if (this.form.categoryName == null || this.form.categoryName == '') {
          this.$message.error('分类不能为空')
          return
        }
      
        this.$axios({
          url: `/api/admin/article`,
          method: 'post',
          data: {
            
            title: this.form.title,
            intro: this.form.intro,
            categoryName: this.form.categoryName,
            filePath: this.$store.state.filePath,
            text: this.text,
            originTitle: this.title
          }
        }).then(res => {
          if (res.data.code == 1) {
            this.$message.success('保存成功')
            // 获取要跳转的路由地址
            const routeUrl = this.$router.resolve({
              name: 'addArticle',
              params: { title: this.form.title }
            }).href;

            // 利用 window.location.href 进行页面跳转和刷新
            window.location.href = routeUrl;
          }else{
            this.$message.error(res.data.msg)
          }
        })


      },
      // v-md-editor 文件上传
      handleUploadImage(event, insertImage, files) {
        // console.log(files);
        // 上传
        console.log(files);
        for (let i = 0; i < files.length; i++) {
          const formData = new FormData();
          formData.append('file', files[i]);
          this.$axios.post(`/api/admin/article/uploadImg`, formData, {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          }).then(res => {
            if (res.data.code == 1) {
              insertImage({
                url: res.data.data,
                desc: files[i].name,
              })
            }
          })
        }
      },
      saveFile(text, html) {
        this.dialogFormVisible = true
        this.text = text
        console.log("text:", text);
        console.log("html:", html);
      },
    },
  }
</script>

<style>
</style>