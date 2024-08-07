# Docker
## Docker数据卷挂载常用命令
![dockerVolumeMethod.png](/mymd/imgs/05cc31fe-c820-421f-bc0f-4c31456b2032dockerVolumeMethod.png)
- 注意：容器与数据卷的挂载要在创建容器时配置，对于创建好的容器，是不能设置数据卷的。而且创建容器的过程中，数据卷会自动创建。
- 建容器并指定数据卷，注意通过 -v 参数来指定数据卷，`-v 数据卷名称:容器内对应目录`
## Docker挂载本地目录
``` powershell
# 挂载本地目录
-v 本地目录:容器内目录
# 挂载本地文件
-v 本地文件:容器内文件
```
注意：本地目录或文件必须以 / 或 ./开头，如果直接以名字开头，会被识别为数据卷名而非本地目录名。
## Dockerfile自定义镜像
### 镜像层级结构图
![dockerLayer.png](/mymd/imgs/45e4fcbe-eb56-4e26-ab99-d187431a2ce5dockerLayer.png)
### 语法
![dockerFileMethod.png](/mymd/imgs/c5432e46-cf9f-4cef-9b14-ea4b4a7e51fcdockerFileMethod.png)
例如，要基于Ubuntu镜像来构建一个Java应用，其Dockerfile内容如下（不建议）：
``` powershell
# 指定基础镜像
FROM ubuntu:16.04
# 配置环境变量，JDK的安装目录、容器内时区
ENV JAVA_DIR=/usr/local
ENV TZ=Asia/Shanghai
# 拷贝jdk和java项目的包
COPY ./jdk8.tar.gz $JAVA_DIR/
COPY ./docker-demo.jar /tmp/app.jar
# 设定时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# 安装JDK
RUN cd $JAVA_DIR \
 && tar -xf ./jdk8.tar.gz \
 && mv ./jdk1.8.0_144 ./java8
# 配置环境变量
ENV JAVA_HOME=$JAVA_DIR/java8
ENV PATH=$PATH:$JAVA_HOME/bin
# 指定项目监听的端口
EXPOSE 8080
# 入口，java项目的启动命令
ENTRYPOINT ["java", "-jar", "/app.jar"]
```
但是为了简洁，基础的系统加JDK环境，我们在此基础上制作java镜像，就可以省去JDK的配置了
``` powershell
# 基础镜像
FROM openjdk:11.0-jre-buster
# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# 拷贝jar包
COPY docker-demo.jar /app.jar
# 入口
ENTRYPOINT ["java", "-jar", "/app.jar"]
```
### 构建镜像
- 先将jar包以及Dockerfile拷贝到虚拟机的任意目录（放在同一目录下）：
- 进入目录，构建镜像
``` powershell
docker build -t jar包名:版本(可以不指定) .
```
- `docker build`: 就是构建一个docker镜像
- `-t docker-demo:1.0`：-t参数是指定镜像的名称（repository和tag）
- `.`: 最后的点是指构建时Dockerfile所在路径，由于我们进入了demo目录，所以指定的是.代表当前目录，也可以直接指定Dockerfile目录：
