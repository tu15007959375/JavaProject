# Nacos部署
## 服务器端docker部署（需要服务器安装好docker）
- 导入sql文件到服务器
- 编写nacos配置文件custom.env（示例如下，改为自己服务器nacos相关信息）
``` powershell
PREFER_HOST_MODE=hostname
MODE=standalone
SPRING_DATASOURCE_PLATFORM=mysql
MYSQL_SERVICE_HOST=192.168.150.101
MYSQL_SERVICE_DB_NAME=nacos
MYSQL_SERVICE_PORT=3306
MYSQL_SERVICE_USER=root
MYSQL_SERVICE_PASSWORD=123
MYSQL_SERVICE_DB_PARAM=characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai
```
- 配置文件custom.env上传至nacos文件夹，执行docker目录（改为自己的配置文件地址）
``` powershell
docker run -d \
--name nacos \
--env-file ./nacos/custom.env \
-p 8848:8848 \
-p 9848:9848 \
-p 9849:9849 \
--restart=always \
nacos/nacos-server:v2.1.0-slim
```
- 启动成功后，访问`http://192.168.150.101:8848/nacos/`（前面的ip地址改为自己的），账号密码都是nacos

## 后端Spring Boot配置
### 服务注册
- 添加依赖
``` xml
<!--nacos 服务注册发现-->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
</dependency>
```
- 配置Nacos
``` YAML
spring:
  application:
    name: item-service # 服务名称
  cloud:
    nacos:
      server-addr: 192.168.150.101:8848 # nacos地址
```
### 服务发现
服务发现需要用到一个工具，DiscoveryClient，SpringCloud已经帮我们自动装配，我们可以直接注入使用（案例如下）：
![nacosDiscovery.png](/mymd/imgs/010f6be9-035e-4ae3-a2ca-1967b0bdcbe4nacosDiscovery.png)