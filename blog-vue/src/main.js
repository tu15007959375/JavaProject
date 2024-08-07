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
// Vue.prototype.$echarts = echarts //可以全局使用 不用每次使用需要在页面导入
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
