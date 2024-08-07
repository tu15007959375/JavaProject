# IOC(Inversion of Control)
## 什么是IOC？
IOC：控制反转，由Spring容器管理bean的整个生命周期。通过反射实现对其他对象的控制，包括初始化、创建、销毁等，解放手动创建对象的过程，同时降低类之间的耦合度。
## IOC的好处？
ioc的思想最核心的地方在于，资源不由使用资源者管理，而由不使用资源的第三方管理，这可以带来很多好处。第一，资源集中管理，实现资源的可配置和易管理。第二，降低了使用资源双方的依赖程度，也就是我们说的耦合度。
## 什么是依赖注入？
依赖注入，是IOC的一个方面，是个通常的概念，它有多种解释。这概念是说你不用创建对象，而只需要描述它如何被创建。你不在代码里直接组装你的组件和服务，但是要在配置文件里描述哪些组件需要哪些服务，之后一个容器（IOC容器）负责把他们组装起来。
依赖注入主要有两种方式：**构造器注入**、**基于 setter 方法注入**和**属性注入**
##  IOC容器初始化过程？
1. 从XML中读取配置文件。
2. 将bean标签解析成 BeanDefinition，如解析 property 元素， 并注入到 BeanDefinition 实例中。
3. 将 BeanDefinition 注册到容器 BeanDefinitionMap 中。
4. BeanFactory 根据 BeanDefinition 的定义信息创建实例化和初始化 bean
单例bean的初始化以及依赖注入一般都在容器初始化阶段进行，只有懒加载（lazy-init为true）的单例bean是在应用第一次调用getBean()时进行初始化和依赖注入。
多例bean 在容器启动时不实例化，即使设置 lazy-init 为 false 也没用，只有调用了getBean()才进行实例化。
## Spring框架中的单例bean是线程安全的吗?
- 不是线程安全的,Spring框架中有一个@Scope注解，默认的值就是singleton，单例的。  
- 因为一般在spring的bean的中都是注入无状态的对象，没有线程安全问题，如果在bean中定义了可修改的成员变量，是要考虑线程安全问题的，可以使用多例或者加锁来解决
## Spring 用到了哪些设计模式？
1、**简单工厂模式**： BeanFactory 就是简单工厂模式的体现，根据传入一个唯一标识来获得 Bean 对象
2、**工厂方法模式**： FactoryBean 就是典型的工厂方法模式。spring在使用 getBean() 调用获得该bean时，会自动调用该bean的 getObject() 方法。每个 Bean 都会对应一个 FactoryBean ，如SqlSessionFactory 对应 SqlSessionFactoryBean 。
3、**单例模式**：一个类仅有一个实例，提供一个访问它的全局访问点。Spring 创建 Bean 实例默认是单例的
4、**适配器模式**：SpringMVC中的适配器 HandlerAdatper 。由于应用会有多个Controller实现，如果需要直接调用Controller方法，那么需要先判断是由哪一个Controller处理请求，然后调用相应的方法。当增加新的 Controller，需要修改原来的逻辑，违反了开闭原则（对修改关闭，对扩展开放）。
![ioc1.png](/mymd/imgs/6889ae8c-adf1-4c6f-88eb-31a1229dc895ioc1.png)
## Bean的生命周期
- 通过BeanDefinition获取bean的定义信息
- 调用构造函数实例化bean
- bean的依赖注入
- 处理Aware接口(BeanNameAware、BeanFactoryAware、ApplicationContextAware)
- Bean的后置处理器BeanPostProcessor-前置
- 初始化方法(lnitializingBean、init-method)
- Bean的后置处理器BeanPostProcessor-后置
- 销毁bean
## Spring中的循环引用
- 循环依赖:循环依赖其实就是循环用,也就是两个或两个以上的bean互相持有对方,最终形成闭环。比如A依赖于B,B依赖于A
- 循环依赖在spring中是允许存在，spring框架依据三级缓存已经解决了大部分的循环依赖
- 一级缓存:单例池，缓存已经经历了完整的生命周期，已经初始化完成的bean对象
- 二级缓存:缓存早期的bean对象(生命周期还没走完)
- 三级缓存:缓存的是ObjectFactory，表示对象工厂，用来创建某个对象的
### 构造方法出现了循环依赖怎么解决?
- A依赖于B，B依赖于A，注入的方式是构造函数
- 原因:由于bean的生命周期中构造函数是第一个执行的，spring框架并不能解决构造函数的的依赖注入
- 解决方案:使用@Lazy进行懒加载，什么时候需要对象再进行bean对象的创建

## BeanFactory和FactoryBean的区别？
**BeanFactory**：管理Bean的容器，Spring中生成的Bean都是由这个接口的实现来管理的。
**FactoryBean**：通常是用来创建比较复杂的bean，一般的bean 直接用xml配置即可，但如果一个bean的创建过程中涉及到很多其他的bean 和复杂的逻辑，直接用xml配置比较麻烦，这时可以考虑用FactoryBean，可以隐藏实例化复杂Bean的细节。
当配置文件中bean标签的class属性配置的实现类是FactoryBean时，通过 getBean()方法返回的不是FactoryBean本身，而是调用FactoryBean#getObject()方法所返回的对象，相当于
FactoryBean#getObject()代理了getBean()方法。如果想得到FactoryBean必须使用 '&' + beanName的方式获取。
## BeanFactory和ApplicationContext有什么区别？
BeanFactory和ApplicationContext是Spring的两大核心接口，都可以当做Spring的容器。其中ApplicationContext是BeanFactory的子接口。
两者区别如下：
1、功能上的区别。BeanFactory是Spring里面最底层的接口，包含了各种Bean的定义，读取bean配置文档，管理bean的加载、实例化，控制bean的生命周期，维护bean之间的依赖关系。
ApplicationContext接口作为BeanFactory的派生，除了提供BeanFactory所具有的功能外，还提供了更完整的框架功能，如继承MessageSource、支持国际化、统一的资源文件访问方式、同时加载多个配置文件等功能。
2、加载方式的区别。BeanFactroy采用的是延迟加载形式来注入Bean的，即只有在使用到某个Bean时(调用getBean())，才对该Bean进行加载实例化。这样，我们就不能发现一些存在的Spring的配置问题。如果Bean的某一个属性没有注入，BeanFacotry加载后，直至第一次使用调用getBean方法才会抛出异常。而ApplicationContext是在容器启动时，一次性创建了所有的Bean。这样，在容器启动时，我们就可以发现Spring中存在的配置错误，这样有利于检查所依赖属性是否注入。 ApplicationContext启动后预载入所有的单例Bean，那么在需要的时候，不需要等待创建bean，因为它们已经创建好了。相对于基本的BeanFactory，ApplicationContext 唯一的不足是占用内存空间。当应用程序配置Bean较多时，程序启动较慢。
3、创建方式的区别。BeanFactory通常以编程的方式被创建，ApplicationContext还能以声明的方式创建，如使用ContextLoader。
4、注册方式的区别。BeanFactory和ApplicationContext都支持BeanPostProcessor、
BeanFactoryPostProcessor的使用，但两者之间的区别是：BeanFactory需要手动注册，而
ApplicationContext则是自动注册。
##  Bean注入容器有哪些方式？
1、@Configuration + @Bean
@Configuration用来声明一个配置类，然后使用 @Bean 注解，用于声明一个bean，将其加入到Spring容器中。
2、通过包扫描特定注解的方式
@ComponentScan放置在我们的配置类上，然后可以指定一个路径，进行扫描带有特定注解的bean，然后加至容器中。
特定注解包括@Controller、@Service、@Repository、@Component
3、@Import注解导入
4、实现BeanDefinitionRegistryPostProcessor进行后置处理。
在Spring容器启动的时候会执行 BeanDefinitionRegistryPostProcessor 的postProcessBeanDefinitionRegistry 方法，就是等beanDefinition加载完毕之后，对beanDefinition进行后置处理，可以在此进行调整IOC容器中的beanDefinition，从而干扰到后面进行初始化bean。
5、使用FactoryBean接口
## Bean的作用域
1、singleton：单例，Spring中的bean默认都是单例的。
2、prototype：每次请求都会创建一个新的bean实例。
3、request：每一次HTTP请求都会产生一个新的bean，该bean仅在当前HTTP request内有效。
4、session：每一次HTTP请求都会产生一个新的bean，该bean仅在当前HTTP session内有效。
5、global-session：全局session作用域。
## Spring自动装配的方式有哪些？
Spring的自动装配有三种模式：byType(根据类型)，byName(根据名称)、constructor(根据构造函数)。
