# JAVA多线程(4)
## 守护线程
* 守护 (Daemon) 线程：运行在后台，为其他前台线程服务。也可以说守护线程是 JVM 中非守护线程的 “佣人”。一旦所有用户线程都结束运行，守护线程会随 JVM 一起结束工作。（GC垃圾回收线程就是一个经典的守护线程）
* 应用场景：为其他线程提供服务支持、需要正常且立刻关闭某个线程时
* 守护线程不能用于访问固有资源，比如读写操作或计算逻辑，因为它在任何时候甚至在一个操作的中间发生中断。
## 线程的状态
线程通常有5种状态：新建、就绪、运行、阻塞和死亡状态
* 新建(new)：新创建了一个线程对象。
* 就绪(runnable)：线程对象创建后，当调用线程对象的 start()方法，该线程处于就绪状态，等待被线程调度选中，获取cpu的使用权。
* 运行(running)：可运行状态(runnable)的线程获得了cpu时间片（timeslice），执行程序代码。
* 阻塞(block)：处于运行状态中的线程由于某种原因，暂时放弃对 CPU的使用权，停止执行，此时进入阻塞状态，直到其进入到就绪状态，才 有机会再次被 CPU 调用以进入到运行状态。阻塞的情况分三种：
  * 等待阻塞(wait->等待对列)：运行状态中的线程执行 wait()方法，JVM会把该线程放入等待队列(waittingqueue)中，使本线程进入到等待阻塞状态；
   * 同步阻塞(lock->锁池)：线程在获取 synchronized 同步锁失败(因为锁被其它线程所占用)，则JVM会把该线程放入锁池(lock pool)中，线程会进入同步阻塞状态；
   * 其他阻塞(sleep/join)： 通过调用线程的 sleep()或 join()或发出了 I/O 请求时，线程会进入到阻塞状态。当 sleep()状态超时、join()等待线程终止或者超时、或者 I/O 处理完毕时，线程重新转入就绪状态。
* 死亡(dead)：线程run()、main()方法执行结束，或者因异常退出了run()方法，则该线程结束生命周期。死亡的线程不可再次复生。

## 线程基本方法
* 线程等待wait()：使一个线程处于等待（阻塞）状态，并且释放所持有的对象的锁；只有等待另外线程的通知或被中断才会返回，wait 方法一般用在同步方法或同步代码块中
* 线程睡眠sleep()：使一个正在运行的线程处于睡眠状态，但不会释放当前占有的锁。是一个静态方法，调用此方法要处理InterruptedException 异常；
* 等待其他线程终止 join()：线程进入阻塞状态，马上释放cpu的执行权，但依然会保留cpu的执行资格，所以有可能cpu下次进行线程调度还会让这个线程获取到执行权继续执行,例如在线程B种调用线程A的join()，那线程B会进入到阻塞队列，直到线程A结束或中断线程;
* 线程让步yield()：使当前线程让出 CPU 执行时间片，与其他线程一起重新竞争 CPU 时间片，执行后线程进入阻塞状态;
* 线程唤醒notify()：唤醒一个处于等待状态的线程，当然在调用此方法的时候，并不能确切的唤醒某一个等待状态的线程，而是由 JVM 确定唤醒哪个线程，而且与优先级无关；
* 线程全部唤醒notityAll()：唤醒所有处于等待状态的线程，该方法并不是将对象的锁给所有线程，而是让它们竞争，只有获得锁的线程才能进入就绪状态；
## 创建线程
* 继承 Thread 类，重写run方法：
* 实现 Runnable 接口，实现run方法：
* 实现 Callable 接口，实现call方法。通过FutureTask创建一个线程，获取到线程执行的返回值：
* 使用 Executors 工具类创建线程池，并开启线程。
## Thread、Runable和Callable 三者区别
* Thread 是一个抽象类，只能被继承，而 Runable、Callable 是接口，需要实现接口中的方法。继承 Thread 重写run()方法，实现Runable接口需要实现run()方法，而Callable是需要实现call()方法。
* Thread 和 Runable 没有返回值，Callable 有返回值，返回值可以被 Future 拿到。
* 实现 Runable 接口的类不能直接调用start()方法，需要 new 一个 Thread 并发该实现类放入 Thread，再通过新建的 Thread 实例来调用start()方法。实现 Callable 接口的类需要借助 FutureTask (将该实现类放入其中)，再将 FutureTask 实例放入 Thread，再通过新建的 Thread 实例来调用start()方法。获取返回值只需要借助 FutureTask 实例调用get()方法即可！
* FutureTask 表示一个异步运算的任务。FutureTask 里面可以传入一个Callable 的具体实现类，可以对这个异步运算的任务的结果进行等待获取、判断是否已经完成、取消任务等操作。只有当运算完成的时候结果才能取回，如果运算尚未完成 get 方法将会阻塞。一个 FutureTask 对象可以对调用了 Callable 和 Runnable 的对象进行包装，由于 FutureTask 也是Runnable 接口的实现类，所以 FutureTask 也可以放入线程池中。
## 线程的 run()和 start()区别
* 通过调用 Thread 类的 start()方法来启动一个线程， 这时此线程是处于就绪状态， 并没有运行。这时无需等待 run 方法体代码执行完毕，可以直接继续执行下面的代码。
* 方法 run()称为线程体，它包含了要执行的这个线程的内容，线程就进入了运行状态，开始运行 run 函数当中的代码。 run 方法运行结束， 此线程终止。然后 CPU 再调度其它线程。
* run() 可以重复调用，而 start()只能调用一次。
* 为什么我们调用 start() 方法时会执行 run() 方法，为什么我们不能直接调用run() 方法？
* 如果直接执行 run() 方法，会把 run 方法当成一个 main 线程下的普通方法去执行，并不会在某个线程中执行它，所以这并不是多线程工作。调用 start 方法方可启动线程并使线程进入就绪状态，而 run 方法只是 thread 的一个普通方法调用，还是在主线程里执行。
## sleep() 和 wait() 区别
两者都可以暂停线程的执行
* 类的不同：sleep() 是 Thread线程类的静态方法，wait() 是 Object类的方法。
* 是否释放锁：sleep() 不释放锁；wait() 释放锁，并且会加入到等待队列中。
* 是否依赖synchronized关键字：sleep不依赖synchronized关键字，wait需要依赖synchronized关键字
* 用途不同：sleep 通常被用于休眠线程；wait 通常被用于线程间交互/通信，
* 用法不同：sleep() 方法执行完成后，不需要被唤醒，线程会自动苏醒，或者可以使用wait(longtimeout)超时后线程会自动苏醒。wait() 方法被调用后，线程不会自动苏醒，需要别的线程调用同一个对象上的 notify()或者 notifyAll() 方法。
## 上下文切换
* 巧妙地利用了时间片轮转的方式， CPU 给每个任务都服务一定的时间，然后把当前任务的状态保存下来，在加载下一任务的状态后，继续服务下一任务，任务的状态保存及再加载, 这段过程就叫做上下文切换。时间片轮转的方式使多个任务在同一颗 CPU 上执行变成了可能。
* 上下文：指某一时间点 CPU 寄存器和程序计数器的内容
* 几种发生上下文切换的情况：
   * 主动让出 CPU，比如调用了 sleep(), wait() 等。
   * 时间片用完，因为操作系统要防止一个线程或者进程长时间占用CPU导致其他线程或者进程饿死。
   * 调用了阻塞类型的系统中断，比如请求 IO，线程被阻塞，被终止或结束运行
## 线程之间通信
* 通过共享内存或基于网络通信
* 如果是基于共享内存进行通信，则需要考虑并发问题，什么时候阻塞，什么时候唤醒
* Java中的wait()、notify()就是阻塞唤醒
* 通过网络就比较简单，通过网络连接将数据发送给对方，当然也要考虑到并发问题，处理方式就是加锁等方式。

## ThreadLocal
* ThreadLocal是Java中所提供的线程本地存储机制，可以利用该机制将数据缓存在某个线程内部，该线程可以在任意时刻、任意方法中获取缓存的数据。
* ThreadLocal底层是通过 TreadLocalMap来实现的，每个Thread对象中都存在一个 ThreadLocalMap，Map的key为 ThreadLocal对象，Map的 value为需要缓存的值 。
* ThreadLocalMap由一个个 Entry对象构成 Entry继承自 WeakReference< Threadlocal<?>>，一个 Entry由 Threadlocal对象和 object构成，由此可见，Entry的key是 Threadlocal对象，并且是一个弱引用。当没指向key的强引用后，该key就会被垃圾收集器回收
* 当执行set方法时， Threadlocal首先会获取当前线程对象，然后获取当前线程的 ThreadLocalMap对象。再以当前 Threadlocal对象为key，将值存储进 Threadlocalmap对象中
* get方法执行过程类似，Threadloca首先会获取当前线程对象，然后获取当前线程的 ThreadLocalMap对象。再以当前 ThreadLocal对象为key，获取对应的value
* 由于每条线程均含有各自私有的 ThreadLocalMap容器，这些容器相互独立互不影响，因此不会存在线程安全性问题，从而也无需使用同步机制来保证多条线程访问容器的互斥性。
* 使用场景：
   * 在进行对象跨层传递的时候，使用ThreadLocal可以避免多次传递，打破层次间的约束
   * 线程间数据隔离
   * 进行事务操作，用于存储线程事务信息
   * 数据库连接，Session会话管理
   * Spring框架在事务开始时会给当前线程绑定一个 Jdbc Connection，在整个事务过程都是使用该线程定的connection来执行数据库操作，实现了事务的隔离性， spring框架里面就是用的 Threadlocal来实现这种隔离。
## ThreadLocal内存泄漏原因，如何避免？
如果在线程池中使用 ThreadLocal会造成内存泄漏，因为当 ThreadLocal对象使用完之后，应该要把设置的key，value也就是Entry对象进行回收，但线程池中的线程不会回收，而线程对象是通过强引用指向 ThreadLocalMap， ThreadLocalMap也是通过强引用指向Entry对象，线程不被回收，Entry对象也就不会被回收，从而出现内存泄漏。
解决办法：
* 在使用了 ThreadLocal对象之后，手动调用ThreadLocal的 remove方法，手动清除Entry对象
* 将ThreadLocal变量定义成private static，这样就一直存在ThreadLocal的强引用，也就能保证任何时候都能将通过ThreadLocal的弱引用访问到Entry的value值，进而清除掉。

