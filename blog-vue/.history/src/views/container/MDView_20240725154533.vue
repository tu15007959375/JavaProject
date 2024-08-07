<template>
  <div>


    <el-descriptions title="" style="margin: auto;padding-left: 45px;padding-top: 45px;width: 890px;line-height: normal;" :column="4" >
      <el-descriptions-item label="发布时间">{{articleInfo.createTime.replace('T',' ')}}</el-descriptions-item>
      <el-descriptions-item label="点赞数">{{articleLike.likeNum}}</el-descriptions-item>
      <el-descriptions-item label="喜欢数">{{articleLike.loveNum}}</el-descriptions-item>
      <el-descriptions-item label="微笑数">{{articleLike.smileNum}}</el-descriptions-item>
      <el-descriptions-item label="分类专栏">
        <el-tag size="small" @click="jumpCategory" style="cursor: pointer;">{{articleInfo.categoryName}}</el-tag>
      </el-descriptions-item>
      <el-descriptions-item label="阅读量">xxx</el-descriptions-item>
      <el-descriptions-item label="总字数">{{msg.length}}</el-descriptions-item>
      <el-descriptions-item label="评论数">
        xxx
      </el-descriptions-item>
      <el-descriptions-item label="文章简介">{{articleInfo.intro}}</el-descriptions-item>
  </el-descriptions>
    <div class="markdown-body">
      
      <!--引入vue-markdown组件-->
      <vue-markdown :key="key" style="text-align: left;" v-highlight class="markdown-body">{{ msg }}</vue-markdown>
    </div>
    <div style="width: 767px;margin: auto;">
      <div style="display: inline-block;">
        <el-image class="mdicon" :src="require('@/assets/icon/like.png')" @click.native="addlike"></el-image>

        <span class="mdspan">{{ articleLike.likeNum }}</span>
      </div>
      <div style="display: inline-block;">
        <el-image class="mdicon" :src="require('@/assets/icon/love.png')" @click.native="addlove"></el-image>
        <span class="mdspan">{{ articleLike.loveNum }}</span>

      </div>
      <div style="display: inline-block;">
        <el-image class="mdicon" :src="require('@/assets/icon/smile.png')" @click.native="addsmile"></el-image>
        <span class="mdspan" style="margin-right: 0px;">{{ articleLike.smileNum }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import FingerprintJS from '@fingerprintjs/fingerprintjs';
import axios from 'axios'
import VueMarkdown from 'vue-markdown'
import 'github-markdown-css/github-markdown.css'
export default {
  components: {
    VueMarkdown
  },
  data() {
    return {
      msg: '',
      key: 0,
      articleLike: [],
      likeflag: 0,
      loveflag: 0,
      smileflag: 0,
      articleInfo:[],
      visitorId: '',
    }
  },
  created() {
    this.showMd()
    this.init()
  },
  methods: {
    async showMd() {
      var str = this.$route.params.title + '.md'
      //注意加上await ,运用import函数 
      // await import('/public/mymd/' + str).then(myModule => {
      //   this.msg = myModule.default;
      // }).catch((err) => {
      //   Notification.error({ title: '错误', message: err })
      //   this.msg = '# 找不到相应的MD文件!!!'
      // });
      await axios.get('/mymd/' + str).then(response => {
        this.msg = response.data
      }).catch(error => {
        console.error('文件读取失败', error)
      })

      //强制重新渲染
      this.key += 1
    },
    init() {
      FingerprintJS.load().then(fp => {
        fp.get().then(result => {
          const visitorId = result.visitorId;
          this.visitorId = visitorId
          console.log(this.visitorId);
          axios({
            url: `/api/user/article/userLike`,
            method: 'post',
            data: {
              browserId: this.visitorId,
              articleTitle: this.$route.params.title,
            }
          }).then(res => {
            if (res.data.code == 1) {
              this.likeflag = res.data.data.likeflag
              this.loveflag = res.data.data.loveflag
              this.smileflag = res.data.data.smileflag
              this.articleInfo = res.data.data
            }
          })
        });
      });
      var articleTitle = this.$route.params.title
      axios({
        url: `/api/user/article/articleLike/${articleTitle}`,
        method: 'get',
      }).then(res => {
        if (res.data.code == 1) {
          // console.log(res.data.data)
          this.articleLike = res.data.data
        }
      })

    },
    addlike() {
      if (this.likeflag == 1) {
        this.$message.error("您已经点赞过了哦！")
        return;
      }
      this.likeflag = 1
      axios({
        url: `/api/user/article`,
        method: 'put',
        data: {
          browserId: this.visitorId,
          articleTitle: this.$route.params.title,
          likeflag: this.likeflag,
        }
      }).then(res => {
        if (res.data.code == 1) {
          this.articleLike.likeNum += 1
          this.$message.success('谢谢您的点赞！！！')
        } else {
          this.$message.error("您已经点赞过了哦！")
        }
      })
    },
    addlove() {
      if (this.loveflag == 1) {
        this.$message.error("您已经点赞过了哦！")
        return;
      }
      this.loveflag = 1
      axios({
        url: `/api/user/article`,
        method: 'put',
        data: {
          browserId: this.visitorId,
          articleTitle: this.$route.params.title,
          loveflag: this.loveflag,
        }
      }).then(res => {
        if (res.data.code == 1) {
          this.articleLike.loveNum += 1
          this.$message.success('谢谢您的点赞！！！')
        } else {
          this.$message.error("您已经点赞过了哦！")
        }
      })
    },
    addsmile() {
      if (this.smileflag == 1) {
        this.$message.error("您已经点赞过了哦！")
        return;
      }
      this.smileflag = 1
      axios({
        url: `/api/user/article`,
        method: 'put',
        data: {
          browserId: this.visitorId,
          articleTitle: this.$route.params.title,
          smileflag: this.smileflag
        }
      }).then(res => {
        if (res.data.code == 1) {
          this.articleLike.smileNum += 1
          this.$message.success('谢谢您的点赞！！！')
        } else {
          this.$message.error("您已经点赞过了哦！")
        }
      })
    },
    jumpCategory(){
      this.$store.commit('setCategoryId', this.articleInfo.categoryId)
          this.$store.commit('setCategoryName', this.articleInfo.categoryName)
          // console.log('进入分类',key[1]);
          this.$router.push({ path: `/${this.articleInfo.categoryName}`, })
    }

  }

}
</script>

<style>
.markdown-body {
  box-sizing: border-box;
  min-width: 200px;
  max-width: 980px;
  margin: 0 auto;
  padding-left: 45px;
}

@media (max-width: 767px) {
  .markdown-body {
    padding: 15px;
  }
}

.mdicon {

  float: left;
  width: 50px;
  height: 50px;
  text-align: center;
  margin-right: 20px;
  margin-top: 50px;
  cursor: pointer;

}

.mdspan {
  line-height: normal;
  float: left;
  color: #fd7286;
  font-size: 25px;
  margin-top: 64px;
  margin-left: -10px;
  font-weight: bolder;
  margin-right: 150px;

}
</style>