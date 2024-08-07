# 学习日记-JVM(1)
## JVM体系结构
* jvm位置：位于操作系统之上，相当于也是一个软件，由它构成的java环境
![jvm1](/mymd/JVM(1)/jvm1.png)
## 类加载器
* 作用：加载class文件
* 分类：虚拟机自带加载器，启动类（根）加载器（Bootstrap classLoader），扩展类加载器（ExtClassLoader），应用程序（系统类）加载器（AppClassLoader）
* 双亲委派机制：
    * 类加载器收到类加载的请求
    * 将请求向上委托给父类加载器完成，一直向上，直到启动类加载器
    * 启动类加载器检查是否能加载，能就使用当前加载器，不能就抛出异常，通知子加载器加载
* 源码如下：
```java
public Class<?> loadClass(String name) throws ClassNotFoundException {
    return loadClass(name, false);
}
//              -----??-----
protected Class<?> loadClass(String name, boolean resolve)
    throws ClassNotFoundException
{
        // 首先，检查是否已经被类加载器加载过
        Class<?> c = findLoadedClass(name);
        if (c == null) {
            try {
                // 存在父加载器，递归的交由父加载器
                if (parent != null) {
                    c = parent.loadClass(name, false);
                } else {
                    // 直到最上面的Bootstrap类加载器
                    c = findBootstrapClassOrNull(name);
                }
            } catch (ClassNotFoundException e) {
                // ClassNotFoundException thrown if class not found
                // from the non-null parent class loader
            }
 
            if (c == null) {
                // If still not found, then invoke findClass in order
                // to find the class.
                c = findClass(name);
            }
        }
        return c;
}
```
## 沙箱安全机制
* 主要限制系统资源访问，例如：CPU、内存、文件系统、网络
* 虚拟机中不同的受保护域（Protected Domain），对应不一样的权限（Permission）
* **组成**：字节码校验器（bytecode verifier），类装载器(class loader)， 存取控制器(access controller)，安全管理器(security manager)，安全软件包(security package) :
* **字节码校验器(bytecode verifier)**：确保lava类文件遵循lava语言规范。这样可以帮助Java程序实现内存保护。但并不是所有的类文件都会经过字节码校验，比如核心类。
* **类装载器(class loader)**：防止恶意代码去干涉善意的代码，比如：双亲委派机制；守护了被信任的类库边界;将代码归入保护域，确定了代码的权限范围可以进行哪些资源操作
* **存取控制器(access controller)**：存取控制器可以控制核心API对操作系统的存取权限，用户可以设定控制策略。
* **安全管理器(security manager)**：安全管理器主要是核心API和操作系统之间的主要接口。比如实现权限控制，比存取控制器优先级高。
* **安全软件包(security package)** :java.security下的类和扩展包下的类，允许用户为应用增加所需要安全特性：安全提供者、消息摘要、数字签名keytools、加密、鉴别。
## Native、方法区
* 带了native关键字，说明超出java的作用范围，需要调用底层库
* 进入本地方法栈（native method stack），调用本地接口JNI（扩展java使用，融合不同的语言为java所用），ex：打印机
* 方法区：static，final，Class，常量池