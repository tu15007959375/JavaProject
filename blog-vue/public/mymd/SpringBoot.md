# Spring Boot
## 介绍⼀下@SpringBootApplication 注解
可以看出⼤概可以把 @SpringBootApplication 看作是@Configuration 、 @EnableAutoConfiguration 、 @ComponentScan注解的集合。根据 SpringBoot 官⽹，这三个注解的作⽤分别是：
- @EnableAutoConfiguration ：启⽤ SpringBoot 的⾃动配置机制
- @ComponentScan ： 扫描被 @Component ( @Service , @Controller)注解的 bean，注解默认会扫描该类所在的包下所有的类。
- @Configuration ：允许在上下⽂中注册额外的 bean 或导⼊其他配置类
## Spring Boot 的⾃动配置是如何实现的?
- @EnableAutoConfiguration 注解通过 Spring 提供的 @Import 注解导⼊了 AutoConfigurationImportSelector 类（ @Import 注解可以导⼊配置类或者 Bean 到当前类中）。
- AutoConfigurationImportSelector 类中 getCandidateConfigurations ⽅法会将所有⾃动配置类的信息以 List 的形式返回。这些配置信息会被Spring 容器作 bean 来管理。
- 其中@EnableAutoConfiguration是实现自动化配置的核心注解。注解通过@Import注解导入对应的配置选择器。内部就是读取了该项目和该项目引用的Jar包的的classpath路径
META-INF/spring.factories件中的所配置的类的全类名。在这些配置类中所定义的Bean会根据条件注解所指定的条件来决定是否需要将其导入到Spring容器中
- @Conditional 注解。 @ConditionalOnClass (指定的类必须存在于类路径下), @ConditionalOnBean (容器中是否有指定的 Bean)等等都是对 @Conditional 注解的扩展。
## Spring Boot 常⽤的读取配置⽂件的⽅法有哪些？
- 使⽤ @Value("${property}") 读取⽐较简单的配置信息
- 通过 @ConfigurationProperties 读取并与 bean 绑定
## Spring Boot 如何监控系统实际运⾏状况？
我们可以使⽤ Spring Boot Actuator 来对 Spring Boot 项⽬进⾏简单的监控。集成了这个模块之后，你的 Spring Boot 应⽤程序就⾃带了⼀些开箱即⽤的获取程序运⾏时的内部状态信息的 API。⽐如通过 GET ⽅法访问 /health 接⼝，你就可以获取应⽤程序的健康指标。
## Spring Boot 如何做请求参数校验？
### 校验注解(JSP)
- @Null 被注释的元素必须为 null
- @NotNull 被注释的元素必须不为 null
- @AssertTrue 被注释的元素必须为 true
- @AssertFalse 被注释的元素必须为 false
- @Min(value) 被注释的元素必须是⼀个数字，其值必须⼤于等于指定的最⼩值
- @Max(value) 被注释的元素必须是⼀个数字，其值必须⼩于等于指定的最⼤值
- @DecimalMin(value) 被注释的元素必须是⼀个数字，其值必须⼤于等于指定的最⼩值
- @DecimalMax(value) 被注释的元素必须是⼀个数字，其值必须⼩于等于指定的最⼤值
- @Size(max=, min=) 被注释的元素的⼤⼩必须在指定的范围内
- @Digits (integer, fraction) 被注释的元素必须是⼀个数字，其值必须在可接受的范围内
- @Past 被注释的元素必须是⼀个过去的⽇期
- @Future 被注释的元素必须是⼀个将来的⽇期
- @Pattern(regex=,flag=) 被注释的元素必须符合指定的正则表达式
### 校验注解(Hibernate Validator )
- @NotBlank(message =) 验证字符串⾮ null，且⻓度必须⼤于 0
- @Email 被注释的元素必须是电⼦邮箱地址
- @Length(min=,max=) 被注释的字符串的⼤⼩必须在指定的范围内
- @NotEmpty 被注释的字符串的必须⾮空
- @Range(min=,max=,message=) 被注释的元素必须在合适的范围内
### 验证请求体(RequestBody)
我们在需要验证的参数上加上了 @Valid 注解，如果验证失败，它将抛出 MethodArgumentNotValidException 。默认情况下，Spring 会将此异常转换为HTTP Status 400（错误求）。
### 验证请求参数(Path Variables 和 Request Parameters)
⼀定⼀定不要忘记在类上加上 Validated 注解了，这个参数可以告诉 Spring 去校验⽅法参数。
## 如何使⽤ Spring Boot 实现全局异常处理？
可以使⽤ @ControllerAdvice 和 @ExceptionHandler 处理全局异常
## Spring Boot 中如何实现定时任务 ?
- 我们使⽤ @Scheduled 注解就能很⽅便地创建⼀个定时任务。
- 单纯依靠 @Scheduled 注解 还不⾏，我们还需要在 SpringBoot 中我们只需要在启动类上加上 @EnableScheduling 注解，这样才可以启动定时任务。 @EnableScheduling 注解的作⽤是发现注解 @Scheduled 的任务并在后台执⾏该任务。
## 你如何理解 Spring Boot 配置加载顺序？
在 Spring Boot 里面，可以使用以下几种方式来加载配置。
- 1）properties文件；
- 2）YAML文件；
- 3）系统环境变量；
- 4）命令行参数；
## Springboot处理CORS跨域请求的三种方法
- 直接采用SpringBoot的注解@CrossOrigin（也支持SpringMVC）
- 处理跨域请求的Configuration，增加一个配置类，CrossOriginConfig.java。继承WebMvcConfigurerAdapter或者实现WebMvcConfigurer接口，其他都不用管，项目启动时，会自动读取配置。
- 采用过滤器（filter）的方式，同方法二加配置类，增加一个CORSFilter 类，并实现Filter接口即可，其他都不用管，接口调用时，会过滤跨域的拦截。
## Spring、Spring MVC、SpringBoot常见注解
### Spring
![springboot1.png](/mymd/imgs/770c8d9d-8ce0-4af3-9a5d-128c6a4c6e6dspringboot1.png)
### SpringSpring MVC
![springboot2.png](/mymd/imgs/757368cb-7dab-4d29-9e94-7672e493bf5bspringboot2.png)
### SpringBoot
![springboot3.png](/mymd/imgs/775986a9-7826-4d17-8847-0e04ac208184springboot3.png)