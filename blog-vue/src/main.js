import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import store from './store'
import VueMarkdownEditor from '@kangc/v-md-editor';
import '@kangc/v-md-editor/lib/style/base-editor.css';
import vuepressTheme from '@kangc/v-md-editor/lib/theme/vuepress.js';
import '@kangc/v-md-editor/lib/theme/style/vuepress.css';
import axios from './axios/index'
import {  Message } from 'element-ui'
import Prism from 'prismjs';
VueMarkdownEditor.use(vuepressTheme, {
  Prism,
});
import githubTheme from '@kangc/v-md-editor/lib/theme/github.js';
import '@kangc/v-md-editor/lib/theme/style/github.css';
// 引入所有语言包
import hljs from 'highlight.js';
VueMarkdownEditor.use(githubTheme, {
  Hljs: hljs,
});
Vue.prototype.$hljs = hljs;
import "highlight.js/styles/github.css";
Vue.directive("highlight", function(el) {
  let blocks = el.querySelectorAll("pre code");
  blocks.forEach(block => {
      hljs.highlightBlock(block);
  });
});
Vue.use(VueMarkdownEditor);
import mdEditor from '@/components/v-md-editor/index';
Vue.component('MdEditor', mdEditor);
Vue.config.productionTip = false
ElementUI.Dialog.props.lockScroll.default = false;
Vue.use(ElementUI);
Vue.prototype.$axios = axios;
// Vue.prototype.$echarts = echarts //可以全局使用 不用每次使用需要在页面导入

//to-将要访问的页面地址,from-从哪个页面访问的,next-放行函数
router.beforeEach((to, from, next) => {
	//如果用户访问的登录页，直接放行;
	if (to.path.includes('/admin') ) {
		//若没有令牌,则推到登录页面;
    var userInfo = JSON.parse(window.localStorage.getItem("userInfo"))
    if(userInfo != null && userInfo.token != null){
      return next();
    }else {
      Message({
        type: 'error',
        message: '该操作需要管理员权限，请登录！！！'
    });
			return next("/login")
		}
	}else{
    next();
  }

})


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
