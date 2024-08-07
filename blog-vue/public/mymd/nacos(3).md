# nacos配置管理
现在依然还有几个问题需要解决：
- 网关路由在配置文件中写死了，如果变更必须重启微服务
- 某些业务配置在配置文件中写死了，每次修改都要重启服务
- 每个微服务都有很多重复的配置，维护成本高

这些问题都可以通过统一的配置管理器服务解决。而Nacos不仅仅具备注册中心功能，也具备配置管理的功能：
![nacos2.jpeg](/mymd/imgs/f4b5ef6f-8c1c-4275-9ed8-c92f33c8a6dcnacos2.jpeg)微服务共享的配置可以统一交给Nacos保存和管理，在Nacos控制台修改配置后，Nacos会将配置变更推送给相关的微服务，并且无需重启即可生效，实现配置热更新。
网关的路由同样是配置，因此同样可以基于这个功能实现动态路由功能，无需重启网关即可修改路由配置。
## 配置共享
我们可以把微服务共享的配置抽取到Nacos中统一管理，这样就不需要每个微服务都重复配置了。分为两步：
- 在Nacos中添加共享配置
- 微服务拉取配置
### 添加共享配置
在nacos控制台分别添加这些配置。
首先是jdbc相关配置，在配置管理->配置列表中点击+新建一个配置,示例如下（dataid为唯一标识，建议起名为shared-xxx.yaml）：
``` YAML
spring:
  datasource:
    url: jdbc:mysql://${hm.db.host:192.168.150.101}:${hm.db.port:3306}/${hm.db.database}?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai
    driver-class-name: com.mysql.cj.jdbc.Driver
    username: ${hm.db.un:root}
    password: ${hm.db.pw:123}
mybatis-plus:
  configuration:
    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler
  global-config:
    db-config:
      update-strategy: not_null
      id-type: auto
```
注意这里的jdbc的相关参数并没有写死，例如：
- 数据库ip：通过${hm.db.host:192.168.150.101}配置了默认值为192.168.150.101，同时允许通过${hm.db.host}来覆盖默认值
- 数据库端口：通过${hm.db.port:3306}配置了默认值为3306，同时允许通过${hm.db.port}来覆盖默认值
- 数据库database：可以通过${hm.db.database}来设定，无默认值

然后是统一的日志配置，命名为shared-log.yaml，配置内容示例如下：
``` YAML
logging:
  level:
    com.hmall: debug
  pattern:
    dateformat: HH:mm:ss:SSS
  file:
    path: "logs/${spring.application.name}"
```
然后是统一的swagger配置，命名为shared-swagger.yaml，配置内容示例如下：
``` YAML
knife4j:
  enable: true
  openapi:
    title: ${hm.swagger.title:黑马商城接口文档}
    description: ${hm.swagger.description:黑马商城接口文档}
    email: ${hm.swagger.email:zhanghuyi@itcast.cn}
    concat: ${hm.swagger.concat:虎哥}
    url: https://www.itcast.cn
    version: v1.0.0
    group:
      default:
        group-name: default
        api-rule: package
        api-rule-resources:
          - ${hm.swagger.package}
```
### 拉取共享配置
接下来，我们要在微服务拉取共享配置。将拉取到的共享配置与本地的application.yaml配置合并，完成项目上下文的初始化。
不过，需要注意的是，读取Nacos配置是SpringCloud上下文（ApplicationContext）初始化时处理的，发生在项目的引导阶段。然后才会初始化SpringBoot上下文，去读取application.yaml。
也就是说引导阶段，application.yaml文件尚未读取，根本不知道nacos 地址，该如何去加载nacos中的配置文件呢？

SpringCloud在初始化上下文的时候会先读取一个名为bootstrap.yaml(或者bootstrap.properties)的文件，如果我们将nacos地址配置到bootstrap.yaml中，那么在项目引导阶段就可以读取nacos中的配置了。
![nacos3.jpeg](/mymd/imgs/fd8f8e40-e4da-4f6b-9950-8ddc2ac3af2fnacos3.jpeg)
因此，微服务整合Nacos配置管理的步骤如下：
1）引入依赖：
在cart-service模块引入依赖：
``` XML
  <!--nacos配置管理-->
  <dependency>
      <groupId>com.alibaba.cloud</groupId>
      <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
  </dependency>
  <!--读取bootstrap文件-->
  <dependency>
      <groupId>org.springframework.cloud</groupId>
      <artifactId>spring-cloud-starter-bootstrap</artifactId>
  </dependency>
```
2）新建bootstrap.yaml
在微服务中的resources目录新建一个bootstrap.yaml文件，内容示例如下：
``` YAML
spring:
  application:
    name: cart-service # 服务名称
  profiles:
    active: dev
  cloud:
    nacos:
      server-addr: 192.168.150.101 # nacos地址
      config:
        file-extension: yaml # 文件后缀名
        shared-configs: # 共享配置
          - dataId: shared-jdbc.yaml # 共享mybatis配置
          - dataId: shared-log.yaml # 共享日志配置
          - dataId: shared-swagger.yaml # 共享日志配置
```
3）修改application.yaml
由于一些配置挪到了bootstrap.yaml，因此application.yaml需要修改为：，然后重启服务
``` YAML
server:
  port: 8082
feign:
  okhttp:
    enabled: true # 开启OKHttp连接池支持
hm:
  swagger:
    title: 购物车服务接口文档
    package: com.hmall.cart.controller
  db:
    database: hm-cart
```
## 配置热更新
这就要用到Nacos的配置热更新能力了，分为两步：
- 在Nacos中添加配置
- 在微服务读取配置
### 添加配置到Nacos
首先，我们在nacos中添加一个配置文件，注意文件的dataId格式，`[服务名]-[spring.active.profile].[后缀名]` 
文件名称由三部分组成：
- 服务名：我们是购物车服务，所以是cart-service
- spring.active.profile：就是spring boot中的spring.active.profile，可以省略，则所有profile共享该配置
- 后缀名：例如yaml
- 
这里我们直接使用cart-service.yaml这个名称，则不管是dev还是local环境都可以共享该配置。
### 配置热更新
接着，我们在微服务中读取配置，实现配置热更新。
在cart-service中新建一个属性读取类：
``` java
package com.hmall.cart.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "hm.cart")
public class CartProperties {
    private Integer maxAmount;
}
```
接着，在业务中使用该属性加载类即可