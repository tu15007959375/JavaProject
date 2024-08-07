# JAVA多线程(2)
##  synchronized 和 ReentrantLock 的区别
* synchronized是一个内置的Java关键字，ReentrantLock是一个类，实现了Lock接口
* synchronized会自动加锁或释放锁，ReentrantLock需要手动加锁和释放锁
* synchronized 无法判断获取锁的状态，ReentrantLock 可以判断是否获取到了锁
* synchronized底层是JVM层面的锁，ReentrantLock是API层面的锁
* synchronized是可重入锁，非公平锁，ReentrantLock是可重入锁，可以选择公平锁和非公平锁
* synchronized锁的是对象，锁信息保存在对象头中，ReentrantLock锁的线程，通过代码中int类型的state标识来标识锁的状态
* 相比synchronized，ReentrantLock增加了一些高级功能。（等待可中断、可实现公平锁、可实现选择性通知）
### Lock接口
在jdk1.5以后，增加了juc并发包且提供了Lock接口用来实现锁的功能，它除了提供了与synchroinzed关键字类似的同步功能，还提供了比synchronized更灵活api实现。可以把 Lock 看成是 synchronized 的扩展版，Lock 提供了无条件的、可轮询的(tryLock 方法)、定时的(tryLock 带参方法)、可中断的(lockInterruptibly)、可多条件队列的(newCondition 方法)锁操作。另外 Lock 的实现类基本都支持非公平锁(默认)和公平锁，synchronized 只支持非公平锁。
### ReentrantLock
ReentantLock 继承接口 Lock 并实现了接口中定义的方法，他是一种可重入锁，除了能完成 synchronized 所能完成的所有工作外，还提供了诸如可响应中断锁、可轮询锁请求、定时锁等避免多线程死锁的方法。
## AQS(AbstractQueuedSynchronizer)
* AQS的全称是AbstractQueuedSynchronizer，是一个用来构建锁和同步器的框架，像ReentrantLock，Semaphore，FutureTask都是基于AQS实现的。
* AQS的工作流程：AQS会维护一个共享资源，当被请求的共享资源空闲，则将请求资源的线程设为有效的工作线程，同时锁定共享资源。如果被请求的资源已经被占用了，AQS就用过队列实现了一套线程阻塞等待以及唤醒时锁分配的机制。
* AQS维护了一个共享资源和一个FIFO的线程等待队列。这个队列是通过CLH队列实现的，该队列是一个双向队列，有Node结点组成，每个Node结点维护一个prev引用和next引用，这两个引用分别指向自己结点的前驱结点和后继结点，同时AQS还维护两个指针Head和Tail，分别指向队列的头部和尾部。
* 源码分析后续补上
## CopyOnWriteArrayList
* 我们都知道将ArrayList作为共享变量，在多线程的情况下是不安全的，解决方法是使用Collections中的SynchronizedList方法，或者我们代码中进行加锁，其实还有另一种线程安全的List，就是CopyOnWriteArrayList。
* 当我们往一个容器添加元素的时候，不直接往当前容器添加，而是先将当前容器进行Copy，复制出一个新的容器，然后新的容器里添加元素，添加完元素之后，再将原容器的引用指向新的容器。对CopyOnWrite容器进行并发的读的时候，不需要加锁，因为当前容器不会添加任何元素。所以CopyOnWrite容器也是一种读写分离的思想，延时更新的策略是通过在写的时候针对的是不同的数据容器来实现的，放弃数据实时性达到数据的最终一致性。
* 先对CopyOnWriteArrayList进行一个总体概览，它具有三个特点：
   * 线程安全的，多线程环境下可以直接使用，无需加锁；
   * 通过锁 + 数组拷贝 + volatile 关键字保证了线程安全；
   * 每次数组操作，都会把数组拷贝一份出来，在新数组上进行操作，操作成功之后再赋值回去。
## CountDownLatch、CyclicBarrier、Semaphore的区别
### CountDownLatch
* CountDownLatch和CyclicBarrier都能够实现线程之间的等待，只不过它们侧重点不同；
   * CountDownLatch一般用于某个线程A等待若干个其他线程执行完任务之后，它才执行；
   * 而CyclicBarrier一般用于一组线程互相等待至某个状态，然后这一组线程再同时执行；
   * 另外，CountDownLatch是不能够重用的，而CyclicBarrier是可以重用的。
Semaphore其实和锁有点类似，它一般用于控制对某组资源的访问权限。
* CountDownLatch：计数器，允许一个或多个线程等待直到其他线程中执行的一组操作完成同步辅助。可以用于高并发测试，即计数积累了一定数量的线程后再一起执行。
原理：
* countDownLatch.countDown(); // 计数器数量-1
* countDownLatch.await(); // 线程会被挂起，等待计数器归零，然后再向下执行，可以设置等待时间
* 代码示例

``` java
import java.util.concurrent.CountDownLatch; // 计数器 
public class CountDownLatchDemo { 
	public static void main(String[] args) throws InterruptedException { 
	    
	    // 总数是6，必须要执行任务的时候，再使用！ 
		CountDownLatch countDownLatch = new CountDownLatch(6); 
		for (int i = 1; i <=6 ; i++) {
 			new Thread(()->{ 
 				System.out.println(Thread.currentThread().getName()+" Go out"); 
 				countDownLatch.countDown(); // 数量-1 
 			},String.valueOf(i)).start(); 
 		}
		countDownLatch.await(); // 等待计数器归零，然后再向下执行 
		System.out.println("Close Door"); 
	} 
}
```
### CyclicBarrier
* CyclicBarrier： 加法计数器，一组线程全部等待到达共同点。达不到会一直等待
* cyclicBarrier.await(); //用来挂起当前线程，直至所有线程都到达brrier状态再同时执行后续任务；
* 代码示例：
``` java
import java.util.concurrent.BrokenBarrierException; 
import java.util.concurrent.CyclicBarrier; 
public class CyclicBarrierDemo { 
	public static void main(String[] args) { 
		/*** 集齐7颗龙珠召唤神龙 */ 
		CyclicBarrier cyclicBarrier = new CyclicBarrier(7,()->{ 
			System.out.println("召唤神龙成功！"); 
		}); 
		for (int i = 1; i <=7 ; i++) { 
			final int temp = i; // lambda能操作到 i 吗 
			new Thread(()->{ 
				System.out.println(Thread.currentThread().getName()+"收 集"+temp+"个龙珠");
				try {
				cyclicBarrier.await(); // 等待 
				} catch (InterruptedException e) { 
					e.printStackTrace(); 
				} catch (BrokenBarrierException e) { 
					e.printStackTrace(); 
				} 
			}).start(); 
		} 
	} 
}
```
### semaphore
* Semaphore：一组计数信号量
* semaphore.acquire(); //获得，假设如果已经满了，等待，等待被释放为止！
* semaphore.release(); //释放，会将当前的信号量释放 + 1，然后唤醒等待的线程！
* 作用： 多个共享资源互斥的使用！并发限流，控制最大的线程数！
* 代码示例
``` java
import java.util.concurrent.Semaphore; 
import java.util.concurrent.TimeUnit; 
public class SemaphoreDemo { 
	public static void main(String[] args) { 
		// 线程数量：停车位! 限流！ 抢车位！6车---3个停车位置
		Semaphore semaphore = new Semaphore(3); 
		for (int i = 1; i <=6 ; i++) { 
			new Thread(()->{ // acquire() 得到 
				try {
					semaphore.acquire(); 
					System.out.println(Thread.currentThread().getName()+"抢到车 位"); 			
					TimeUnit.SECONDS.sleep(2); 
					System.out.println(Thread.currentThread().getName()+"离开车 位"); 
				} catch (InterruptedException e) { 
					e.printStackTrace(); 
				} finally { 
					semaphore.release(); // release() 释放 
				} 
			},String.valueOf(i)).start(); 
		} 
	} 
}
```
## ReadWriteLock读写锁
为了提高性能，Java 提供了读写锁，在读的地方使用读锁，在写的地方使用写锁，灵活控制，如果没有写锁的情况下，读是无阻塞的,在一定程度上提高了程序的执行效率。读写锁分为读锁和写锁，多个读锁不互斥，读锁与写锁互斥，这是由 jvm 自己控制的，你只要上好相应的锁即可。
* 读锁：如果你的代码只读数据，可以很多人同时读，但不能同时写，那就上读锁
* 写锁：如果你的代码修改数据，只能有一个人在写，且不能同时读取，那就上写锁
* Java 中读写锁有个接口 java.util.concurrent.locks.ReadWriteLock ，也有具体的实现ReentrantReadWriteLock。




