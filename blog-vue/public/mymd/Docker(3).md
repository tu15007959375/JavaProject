# Docker
## Docker容器网络互联
### 常见命令
![dockerNetworkMethod.png](/mymd/imgs/59e4314d-7403-4003-85ff-90050dc822b7dockerNetworkMethod.png)
注：也可以在创建容器时指定网络，即`docker run -d ..... --network 网络名`
## DockerCompose
### 常见命令
![dockerComposeMethod.png](/mymd/imgs/c43f9dc3-4084-4a98-a7f0-a3beaeab3e8adockerComposeMethod.png)
### 部署项目实例
``` powershell
version: "3.8"

services:
  mysql:
    image: mysql
    container_name: mysql
    ports:
      - "3306:3306"
    environment:
      TZ: Asia/Shanghai
      MYSQL_ROOT_PASSWORD: 123
    volumes:
      - "./mysql/conf:/etc/mysql/conf.d"
      - "./mysql/data:/var/lib/mysql"
      - "./mysql/init:/docker-entrypoint-initdb.d"
    networks:
      - hm-net
  hmall:
    build: 
      context: .
      dockerfile: Dockerfile
    container_name: hmall
    ports:
      - "8080:8080"
    networks:
      - hm-net
    depends_on:
      - mysql
  nginx:
    image: nginx
    container_name: nginx
    ports:
      - "18080:18080"
      - "18081:18081"
    volumes:
      - "./nginx/nginx.conf:/etc/nginx/nginx.conf"
      - "./nginx/html:/usr/share/nginx/html"
    depends_on:
      - hmall
    networks:
      - hm-net
networks:
  hm-net:
    name: hmall
```