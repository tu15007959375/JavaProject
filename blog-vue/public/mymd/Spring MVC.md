# Spring MVC
## MVC定义
- MVC 是模型(Model)、视图(View)、控制器(Controller)的简写，其核⼼思想是通过将业务逻辑、数据、显示分离来组织代码
- MVC 是⼀种设计模式， Spring MVC 是⼀款很优秀的 MVC 框架。 Spring MVC 可以帮助我们进⾏更简洁的 Web 层的开发，并且它天⽣与 Spring 框架集成。 Spring MVC 下我们⼀般把后端项⽬分为Service 层（处理业务）、 Dao 层（数据库操作）、 Entity 层（实体类）、 Controller 层(控制层，返回数据给前台⻚⾯)。
## Spring MVC 的核⼼组件有哪些？
- DispatcherServlet ： 核⼼的中央处理器，负责接收请求、分发，并给予客户端响应。
- HandlerMapping ： 处理器映射器，根据 uri 去匹配查找能处理的 Handler ，并会将请求涉及到的拦截器和 Handler ⼀起封装。
- HandlerAdapter ： 处理器适配器，根据 HandlerMapping 找到的 Handler ，适配执⾏对应的Handler ；Handler ： 请求处理器，处理实际请求的处理器。
- ViewResolver ： 视图解析器，根据 Handler 返回的逻辑视图 / 视图，解析并渲染真正的视图，并传递给 DispatcherServlet 响应客户端
## SpringMVC ⼯作原理了解吗（执行流程）?（JSP开发）
![springmvc1.png](/mymd/imgs/d3f86629-9470-45e6-98f4-0e469b0ab5d8springmvc1.png)
- 客户端（浏览器）发送请求， DispatcherServlet 拦截请求。
- DispatcherServlet 根据请求信息调⽤ HandlerMapping 。 HandlerMapping 根据 uri 去匹配查找能处理的 Handler （也就是我们平常说的 Controller 控制器） ，并会将请求涉及到的拦截器和Handler ⼀起封装。
- DispatcherServlet 调⽤ HandlerAdapter 适配执⾏ Handler 。
- (下面是JSP的流程)
- Handler 完成对⽤户请求的处理后，会返回⼀个 ModelAndView 对象给DispatcherServlet ， ModelAndView 顾名思义，包含了数据模型以及相应的视图的信息。 Model 是返回的数据对象， View 是个逻辑上的 View 。
- ViewResolver 会根据逻辑 View 查找实际的 View 。
- DispaterServlet 把返回的 Model 传给 View （视图渲染）。
- 把 View 返回给请求者（浏览器）
## SpringMVC ⼯作原理了解吗（执行流程）?（前后端接口开发）
- 前三步都一样
- 方法上添加了@ResponseBody
- 通过HttpMessageConverter来返回结果转换为JSON并响应