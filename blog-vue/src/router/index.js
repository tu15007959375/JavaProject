import Vue from 'vue'
import VueRouter from 'vue-router'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
Vue.use(VueRouter)

const routes = [
  {
    path: '/admin',
    name: 'admin',
    component: () => import('../views/admin/adminView.vue'),
    redirect:'/admin/index',
    children:[
      {
        path: '/admin/article',
        name: 'articleAd',
        component: () => import('../views/admin/ArticleAdView.vue')
      },
      {
        path: '/admin/addArticle/:title?',
        name: 'addArticle',
        component: () => import('../views/admin/AddArticleView.vue')
      },
      {
        path: '/admin/category',
        name: 'categoryAd',
        component: () => import('../views/admin/CategoryAdView.vue')
      },
      {
        path: '/admin/memo',
        name: 'memoAd',
        component: () => import('../views/admin/MemoAdView.vue')
      },
      {
        path: '/admin/index',
        name: 'index',
        component: () => import('../views/admin/ChartView.vue')
      }
    ]
  },
  {
    path: '/',
    name: 'home',
    component: () => import('../views/container/HomeView.vue'),
    children: [
      {
        path: '/navigation',
        name: 'navigation',
        component: () => import('../views/container/NavigationView.vue')
      },
      {
        path: '/memo',
        name: 'memo',
        component: () => import('../views/container/MemoView.vue')
      },
      {
        path: '/login',
        name: 'login',
        component: () => import('../views/container/LoginView.vue')
      },
      {
        path: '/:categoryName?',
        name: 'main',
        component: () => import('../views/container/MainView.vue')
      },
      {
        path: ':categoryName/:title',
        name: 'mdShow',
        component: () => import('../views/container/MDView.vue')
      }

    ]
  },
  {
    path: '/404',
    component: () => import('../views/404View.vue')
  },
  {
    path: '*',
    redirect:'/404'
  }
]
const router = new VueRouter({
  mode: 'history',
  routes
})



export default router
