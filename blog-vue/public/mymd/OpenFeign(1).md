# OpenFeign
- 利用Nacos实现了服务的治理，利用RestTemplate实现了服务的远程调用。但是远程调用的代码太复杂了
- OpenFeign就利用SpringMVC的相关注解来声明上述4个参数，然后基于动态代理帮我们生成远程调用的代码，而无需我们手动再编写，非常方便
## 快速入门
### 引入依赖
``` xml
  <!--openFeign-->
  <dependency>
      <groupId>org.springframework.cloud</groupId>
      <artifactId>spring-cloud-starter-openfeign</artifactId>
  </dependency>
  <!--负载均衡器-->
  <dependency>
      <groupId>org.springframework.cloud</groupId>
      <artifactId>spring-cloud-starter-loadbalancer</artifactId>
  </dependency>
```
### 启用OpenFeign
接下来，我们在需要用到远程调用的启动类上添加`@EnableFeignClients`注解，启动OpenFeign功能
### 编写OpenFeign客户端
代码示例如下：
``` java
package com.hmall.cart.client;

import com.hmall.cart.domain.dto.ItemDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient("item-service")
public interface ItemClient {

    @GetMapping("/items")
    List<ItemDTO> queryItemByIds(@RequestParam("ids") Collection<Long> ids);
}
```
接口中的几个关键信息：
- `@FeignClient("item-service")` ：声明服务名称
- `@GetMapping` ：声明请求方式
- `@GetMapping("/items")` ：声明请求路径
- `@RequestParam("ids") Collection<Long> ids` ：声明请求参数
- `List<ItemDTO>` ：返回值类型
### 使用FeignClient
最后在相应处进行注入和调用即可，ex
![openfeignex1.png](/mymd/imgs/f67536e8-bebf-47e0-a924-8516d7b36673openfeignex1.png)
## 连接池
### 引入依赖
``` xml
<!--OK http 的依赖 -->
<dependency>
  <groupId>io.github.openfeign</groupId>
  <artifactId>feign-okhttp</artifactId>
</dependency>
```
### 开启连接池
``` YAML
feign:
  okhttp:
    enabled: true # 开启OKHttp功能
```
重启服务，连接池就生效了。
