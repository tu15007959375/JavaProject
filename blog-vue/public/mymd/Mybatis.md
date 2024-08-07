# Mybatis
## 什么是数据持久化？
数据持久化是将内存中的数据模型转换为存储模型，以及将存储模型转换为内存中的数据模型的统称。例如，文件的存储、数据的读取等都是数据持久化操作。数据模型可以是任何数据结构或对象的模型、XML、二进制流等。 当我们编写应用程序操作数据库，对表数据进行增删改查的操作的时候就是数据持久化的操作。
## 什么是ORM？
ORM（Object/Relational Mapping）即对象关系映射，是一种数据持久化技术。它在对象模型和关系型数据库直接建立起对应关系，并且提供一种机制，通过JavaBean对象去操作数据库表的数据。 MyBatis通过简单的XML或者注解的方式进行配置和原始映射，将实体类和SQL语句之间建立映射关系，是一种半自动（之所以说是半自动，因为我们要自己写SQL）的ORM实现。
## MyBatis执行流程
- 读取MyBatis配置文件:mybatis-config.xml加载运行环境和映射文件
- 构造会话工厂SqlSessionFactory
- 会话工厂创建SqlSession对象 (包含了执行SQL语句的所有方法)
- 操作数据库的接口，Executor执行器，同时负责查询缓存的维护
- Executor接口的执行方法中有一个MappedStatement类型的参数，封装了映射信息
- 输入参数映射
- 输出结果映射
## MyBaits延迟加载
- 延迟加载的意思是:就是在需要用到数据时才进行加载，不需要用到数据时就不加载数据。
- Mybatis支持一对一关联对象和一对多关联集合对象的延迟加载
- 在Mvbatis配置文件中，可以配置是否启用延迟加lazyLoadinaEnabled=truelfalse，默认是关闭的

延迟加载底层原理
- 使用CGLIB创建目标对象的代理对象
- 当调用目标方法时，进入拦截器invoke方法，发现目标方法是null值，执行sql查询
- 获取数据以后，调用set方法设置属性值，再继续查询目标方法，就有值了
## MyBatis与Hibernate有哪些不同？
- Mybatis和hibernate不同，它不完全是一个ORM框架，因为MyBatis需要程序员自己编写Sql语句。
- Mybatis直接编写原生态sql，可以严格控制sql执行性能，灵活度高，非常适合对关系数据模型要求不高的软件开发，因为这类软件需求变化频繁，一但需求变化要求迅速输出成果。但是灵活的前提是mybatis无法做到数据库无关性，如果需要实现支持多种数据库的软件，则需要自定义多套sql映射文件，工作量大。
- Hibernate对象/关系映射能力强，数据库无关性好，对于关系模型要求高的软件，如果用hibernate开发可以节省很多代码，提高效率。
## #{}和${}的区别是什么？
- #{} 是预编译处理，${}是字符串替换。
- Mybatis在处理#{}时，会将sql中的#{}替换为?号，调用PreparedStatement的set方法来赋值；
- Mybatis在处理${}时，就是把${}替换成变量的值。
- 使用#{}可以有效的防止SQL注入，提高系统安全性。
## Dao接口的工作原理是什么？Dao接口里的方法，参数不同时，方法能重载吗？
Dao接口即Mapper接口。接口的全限名，就是映射文件中的namespace的值；接口的方法名，就是映射文件中Mapper的Statement的id值；接口方法内的参数，就是传递给sql的参数。 Mapper接口是没有实现类的，当调用接口方法时，接口全限名+方法名拼接字符串作为key值，可唯一定位一个MapperStatement。在Mybatis中每、、、标签，都会被解析为一个MapperStatement对象。 Mapper接口里的方法，是不能重载的，因为是使用 全限名+方法名 的保存和寻找策略。Mapper 接口的工作原理是JDK动态代理，Mybatis运行时会使用JDK动态代理为Mapper接口生成代理对象proxy，代理对象会拦截接口方法，转而执行MapperStatement所代表的sql，然后将sql执行结果返回。
## Mybatis是如何进行分页的？分页插件的原理是什么？
Mybatis使用RowBounds对象进行分页，它是针对ResultSet结果集执行的内存分页，而非物理分页。可以在sql内直接书写带有物理分页的参数来完成物理分页功能，也可以使用分页插件来完成物理分页。 分页插件的基本原理是使用Mybatis提供的插件接口，实现自定义插件，在插件的拦截方法内拦截待执行的sql，然后重写sql，根据dialect方言，添加对应的物理分页语句和物理分页参数。
## Mybatis是如何将sql执行结果封装为目标对象并返回的？都有哪些映射形式？
- 第一种是使用``标签，逐一定义数据库列名和对象属性名之间的映射关系。
- 第二种是使用sql列的别名功能，将列的别名书写为对象属性名。
> 有了列名与属性名的映射关系后，Mybatis通过反射创建对象，同时使用反射给对象的属性逐一赋值并返回，那些找不到映射关系的属性，是无法完成赋值的。
## Mybatis的Xml映射文件中，不同的Xml映射文件，id是否可以重复？
不同的Xml映射文件，如果配置了namespace，那么id可以重复；如果没有配置namespace，那么id不能重复； 原因就是namespace+id是作为Map <String,MapperStatement> 的key使用的，如果没有namespace，就剩下id，那么，id重复会导致数据互相覆盖。有了namespace，自然id就可以重复，namespace不同，namespace+id自然也就不同。
## MyBatis实现一对一有几种方式?具体怎么操作的？
有联合查询和嵌套查询,联合查询是几个表联合查询,只查询一次, 通过在resultMap里面配置association节点配置一对一的类就可以完成； 嵌套查询是先查一个表，根据这个表里面的结果的 外键id，去再另外一个表里面查询数据,也是通过association配置，但另外一个表的查询通过select属性配置。
## MyBatis实现一对多有几种方式,怎么操作的？
有联合查询和嵌套查询。联合查询是几个表联合查询,只查询一次,通过在resultMap里面的collection节点配置一对多的类就可以完成；嵌套查询是先查一个表,根据这个表里面的 结果的外键id,去再另外一个表里面查询数据,也是通过配置collection,但另外一个表的查询通过select节点配置。
## Mybatis是否支持延迟加载？如果支持，它的实现原理是什么？
Mybatis仅支持association关联对象和collection关联集合对象的延迟加载，association指的就是一对一，collection指的就是一对多查询。在Mybatis配置文件中，可以配置是否启用延迟加载lazyLoadingEnabled=true|false。 它的原理是，使用CGLIB创建目标对象的代理对象，当调用目标方法时，进入拦截器方法，比如调用a.getB().getName()，拦截器invoke()方法发现a.getB()是null值，那么就会单独发送事先保存好的查询关联B对象的sql，把B查询上来，然后调用a.setB(b)，于是a的对象b属性就有值了，接着完成a.getB().getName()方法的调用。
## Mybatis的一级、二级缓存
- 一级缓存: 基于 PerpetualCache 的 HashMap 本地缓存，其存储作用域为 Session，当 Session flush 或 close 之后，该 Session 中的所有 Cache 就将清空，默认打开一级缓存。
- 二级缓存与一级缓存其机制相同，默认也是采用 PerpetualCache，HashMap 存储，不同在于其存储作用域为 Mapper(Namespace)，并且可自定义存储源，如 Ehcache。默认不打开二级缓存，要开启二级缓存，使用二级缓存属性类需要实现Serializable序列化接口(可用来保存对象的状态),可在它的映射文件中配置 ；
- 对于缓存数据更新机制，当某一个作用域(一级缓存 Session/二级缓存Namespaces)的进行了C/U/D 操作后，默认该作用域下所有 select 中的缓存将被 clear。
## 什么是MyBatis的接口绑定？有哪些实现方式？
- 接口绑定，就是在MyBatis中任意定义接口,然后把接口里面的方法和SQL语句绑定, 我们直接调用接口方法就可以,这样比起原来了SqlSession提供的方法我们可以有更加灵活的选择和设置。 接口绑定有两种实现方式：
- 注解绑定，就是在接口的方法上面加上 @Select、@Update等注解，里面包含Sql语句来绑定；
- 另外一种就是通过xml里面写SQL来绑定, 在这种情况下,要指定xml映射文件里面的namespace必须为接口的全路径名。当Sql语句比较简单时候,用注解绑定, 当SQL语句比较复杂时候,用xml绑定,一般用xml绑定的比较多。
## mybatis是如何防止SQL注入的？
- #将传入的数据都当成一个字符串，会对自动传入的数据加一个双引号。 如：where username=#{username}，如果传入的值是111,那么解析成sql时的值为where username="111", 如果传入的值是id，则解析成的sql为where username="id".
- $将传入的数据直接显示生成在sql中。如：where username=${username}，如果传入的值是111,那么解析成sql时的值为where username=111；如果传入的值是：drop table user;，则解析成的sql为：select id, username, password, role from user where username=;drop table user;
- #方式能够很大程度防止sql注入，$方式无法防止Sql注入。
- $方式一般用于传入数据库对象，例如传入表名.
- 一般能用#的就别用$，若不得不使用“${xxx}”这样的参数，要手工地做好过滤工作，来防止sql注入攻击。
- 在MyBatis中，“${xxx}”这样格式的参数会直接参与SQL编译，从而不能避免注入攻击。但涉及到动态表名和列名时，只能使用“${xxx}”这样的参数格式。所以，这样的参数需要我们在代码中手工进行处理来防止注入。