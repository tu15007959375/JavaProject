# Docker
## Docker部署流程
![dockerFlow.png](/mymd/imgs/e628ef2b-4051-42b7-8d73-c4d1cad82c09dockerFlow.png)
``` powershell
docker run -d \
  --name mysql \
  -p 3306:3306 \
  -e TZ=Asia/Shanghai \
  -e MYSQL_ROOT_PASSWORD=123 \
  mysql
```
- `docker run -d`：创建并运行一个容器，-d则是让容器以后台进程运行
- `name mysql`: 给容器起个名字叫mysql，你可以叫别的
- `p 3306:3306`: 设置端口映射。
- `mysql` : 设置镜像名称，Docker会根据这个名字搜索并下载镜像
  - 格式：REPOSITORY:TAG，例如mysql:8.0，其中REPOSITORY可以理解为镜像名，TAG是版本号
  - 在未指定TAG的情况下，默认是最新版本，也就是mysql:latest
## Docker常用命令
![dockerMethod.png](/mymd/imgs/b0547709-5547-4f79-b933-74db1b8af13bdockerMethod.png)
![dockerMethodFlow.png](/mymd/imgs/4867f1b8-8d18-4815-bddc-32370981d9bbdockerMethodFlow.png)
## Docker别名
``` powershell
# 修改/root/.bashrc文件
vi /root/.bashrc
内容如下：
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}\t{{.Names}}"'
alias dis='docker images'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
```
执行命令`source /root/.bashrc`即可生效