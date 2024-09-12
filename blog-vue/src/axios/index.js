import axios from 'axios'
// import router from '@/router'
const service = axios.create({
	baseURL: process.env.VUE_APP_BASE_API, // url
	timeout: 5000  // 响应时间
})
service.interceptors.request.use(config => {
    //例：若存在token则带token
    // const token = store.state.userInfo.token;
    if(window.localStorage.getItem("userInfo") == null){
        return config;
    }
    const token = JSON.parse(window.localStorage.getItem("userInfo")).token
    // console.log("token:"+token);
    if (token) {
        console.log("请求附带token");
        config.headers.Authorization = token
    }
    return config;
}, err => {
    console.log("请求拦截=>", err);
    return err;
})

// service.interceptors.response.use((res) => {
// 	//后端拦截器拦截状态码;
// 	if (res.data == '401') {
// 		router.push('/login')
// 	}
// 	return res;
// });
export default service