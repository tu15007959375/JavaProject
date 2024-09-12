
<template>
	<div class="center">

		<div class="login">
			<div :class="overlaylong">
				<div class="overlaylong-Signin" v-if="disfiex == 0">
					<h2 class="overlaylongH2">登录</h2>
					<el-input  v-model="username" placeholder="用户名" style="line-height: normal;margin-bottom: 20px;" clearable ></el-input>
					<el-input  v-model="password" placeholder="密码" style="line-height: normal;" show-password @keyup.enter.native="Signin"></el-input>
					<button class="inupbutton" @click="Signin">登录</button>
				</div>
				<!-- <div class="overlaylong-Signup" v-if="disfiex == 1">
					<h2 class="overlaylongH2">注册</h2>
					<input type="text" placeholder="用户名">
					<input type="text" placeholder="密码">
					<button class="inupbutton" @click="Signup">注册</button>
				</div>
  -->
			</div>
			<div :class="overlaytitle">
				<div class="overlaytitle-Signin" v-if="disfiex == 0">
					<h2 class="overlaytitleH2">mblog后台登录</h2>
                    
					<p class="overlaytitleP" style="line-height: normal;">
                    <br>
                    <br>

						如果你想查看后台管理演示，请登录
                        <br>
                        <br>
                        <br>
					</p>
					<!-- <div class="buttongohs" @click="Signup">注册</div> -->
				</div>
				<!-- <div class="overlaytitle-Signup" v-if="disfiex == 1">
					<h2 class="overlaytitleH2">Welcome Back!</h2>
					<p class="overlaytitleP">To keep connected with us please login with your personal info</p>
				</div> -->
			</div>
		</div>
 
	</div>
</template>
 
<script>
	export default {
		data() {
			return {
				overlaylong: 'overlaylong',
				overlaytitle: 'overlaytitle',
				disfiex: 0,
                username:"",
                password:""			}
		},
		methods: {
			Signin() {
                if(this.username == "" || this.password == ""){
                    this.$message.error("账号或密码为空");
                }
                this.$axios({
                    url: `/api/user/login`,
                    method: 'post',
                    data: {
                        name: this.username,
                        password: this.password
                    }
                }).then(res => {
                    if (res.data.code == 1) {
                        console.log("登录校验通过，token为:"+res.data.data.token);
                        // this.$store.commit('setUserInfo', res.data.data)
                        window.localStorage.setItem("userInfo",JSON.stringify(res.data.data))
                        this.$message.success("登录成功")
						// this.$store.commit('setIsLogin', true)
                        this.$router.push({ path: `/admin` })
						
                    }else{
                        this.$message.error("账号或密码错误，请重新登录");
                        this.$router.push({ path: `/login` })
                    }
                })
			},

		}
	}
</script>
<style scoped>
	.center {
        height: 600px;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;

	}

 
	.login {
		background-color: #fff;
		border-radius: 10px;
		box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
		/* position: relative;
		overflow: hidden; */
		width: 768px;
		max-width: 100%;
		min-height: 480px;
		margin-top: 100px;
        margin-bottom: 100px;
		display: flex;
		background: -webkit-linear-gradient(right, #4284db, #29eac4);
	}
 
	.overlaylong {
		border-radius: 10px 0 0 10px;
		width: 50%;
		height: 480px;
		background-color: #fff;
		display: flex;
		align-items: center;
		justify-content: center;
	}
 
	.overlaylongleft {
		border-radius: 0px 10px 10px 0px;
		width: 50%;
		height: 480px;
		background-color: #fff;
		transform: translateX(100%);
		transition: transform 0.6s ease-in-out;
		display: flex;
		align-items: center;
		justify-content: center;
	}
 
	.overlaylongright {
		border-radius: 10px 0 0 10px;
		width: 50%;
		height: 480px;
		background-color: #fff;
		transform: translateX(0%);
		transition: transform 0.6s ease-in-out;
		display: flex;
		align-items: center;
		justify-content: center;
	}
 
	.overlaytitle {
		border-radius: 0px 10px 10px 0px;
		width: 50%;
		height: 480px;
		background-color: rgba(0, 0, 0, 0);
		display: flex;
		align-items: center;
		justify-content: center;
	}
 
 
	.overlaytitleH2 {
		font-size: 30px;
		color: #fff;
	}
 
	.overlaytitleP {
		font-size: 15px;
		color: #fff;
		margin-top: 20px;
	}
 
	.overlaytitleleft {
		border-radius: 0px 10px 10px 0px;
		width: 50%;
		height: 480px;
		background-color: rgba(0, 0, 0, 0);
		display: flex;
		align-items: center;
		justify-content: center;
		transform: translateX(0%);
		transition: transform 0.6s ease-in-out;
	}
 
	.overlaytitleright {
		border-radius: 0px 10px 10px 0px;
		width: 50%;
		height: 480px;
		background-color: rgba(0, 0, 0, 0);
		display: flex;
		align-items: center;
		justify-content: center;
		transform: translateX(-100%);
		transition: transform 0.6s ease-in-out;
	}
 
	.overlaytitle-Signin {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
 
	.overlaytitle-Signup {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
 
	.buttongohs {
		width: 180px;
		height: 40px;
		border-radius: 50px;
		border: 1px solid #fff;
		color: #fff;
		font-size: 15px;
		text-align: center;
		line-height: 40px;
		margin-top: 40px;
	}
 
	.overlaylongH2 {
		font-size: 25px;
		color: black;
		/* width: 250px; */
	}
 
	.overlaylong-Signin {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
 
	.overlaylong-Signup {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
 
	input {
		background-color: #eee;
		border: none;
		padding: 12px 15px;
		margin: 10px 0;
		width: 240px;
	}
	h3{
		font-size: 10px;
		margin-top: 10px;
		cursor: pointer;
	}
	.inupbutton{
		background-color: #29eac4;
        cursor: pointer;
		border: none;
		width: 180px;
		height: 40px;
		border-radius: 50px;
		font-size: 15px;
		color: #fff;	
		text-align: center;
		line-height: 40px;
		margin-top: 30px;
	}
</style>
 