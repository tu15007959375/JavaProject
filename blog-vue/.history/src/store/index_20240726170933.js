import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
//集中管理多个组件共享数据
export default new Vuex.Store({
  state: {
    categoryId: -1,
    categoryName: '',
    searchValue:'',
    categoryNameList:[],
    filePath:'C:/Code/JavaProject/blog-vue/public/mymd',//生产/服务器环境：/home/tjx/blog/vue/dist/mymd  开发/本地环境：C:/Program Files/Code/JavaProject/blog-vue/public/mymd
  },
  getters: {
  },
  //同步操作
  mutations: {
    setCategoryId(state,categoryId) {
      state.categoryId = categoryId
    },
    setCategoryName(state, categoryName) {
      state.categoryName = categoryName
    },
    setSearchValue(state, searchValue) {
      state.searchValue = searchValue
    },
    setFilePath(state,filePath){
      state.filePath = filePath
    },
    setCategoryNameList(state,categoryNameList){
      state.categoryNameList = categoryNameList
    }
  },
  //异步请求
  actions: {
  },
  modules: {
  }
})
