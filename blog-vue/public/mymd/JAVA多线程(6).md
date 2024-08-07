# JAVA多线程(6)
## AQS类的定义
``` java
public abstract class AbstractQueuedSynchronizer
    extends AbstractOwnableSynchronizer
    implements java.io.Serializable { 
   /**
    * state变量表示锁的状态
    * 0 表示未锁定
    * 大于0表示已锁定
    * 需要注意的是，这个值可以用来实现锁的【可重入性】，例如 state=3 就表示锁被同一个线程获取了3次，想要完全解锁，必须要对应的解锁3次
    * 同时这个变量还是用volatile关键字修饰的，保证可见性
    */
    private volatile int state;
	/**
     * 等待队列的头节点，只能通过setHead方法修改
     * 如果head存在，能保证waitStatus状态不为CANCELLED
     */
    private transient volatile Node head;

    /**
     * 等待队列的尾结点，只能通过enq方法来添加新的等待节点
     */
    private transient volatile Node tail;
}
```
* transient：一旦变量被transient修饰，变量将不再是对象持久化的一部分，该变量内容在序列化后无法获得访问
* AbstractQueuedSynchronizer从名字上就可看出本质是一个队列（Queue），其内部维护着FIFO的双向队列，也就是CLH队列
* CLH队列：它是一个自旋锁，能确保无饥饿性，提供先来先服务的公平性。同时它也是一种基于链表的可扩展、高性能、公平的自旋锁，申请线程只在本地变量上自旋，它不断轮询前驱的状态，如果发现前驱释放了锁就结束自旋
### 内部类Node
``` java
static final class Node {
    // 节点正在共享模式下等待的标记
    static final Node SHARED = new Node();
    // 节点正在以独占模式等待的标记
    static final Node EXCLUSIVE = null;
    // waitStatus变量的可选值，因为超时或者或者被中断，节点会被设置成取消状态。被取消的节点不会参与锁竞争，状态也不会再改变
    static final int CANCELLED =  1;
    // waitStatus变量的可选值，表示后继节点处于等待状态，如果当前节点释放了锁或者被取消，会通知后继节点去运行
    static final int SIGNAL    = -1;
    // waitStatus变量的可选值，表示节点处于condition队列中，正在等待被唤醒
    static final int CONDITION = -2;
    // waitStatus变量的可选值，下一次acquireShared应该无条件传播
    static final int PROPAGATE = -3;
   // 节点的等待状态
    volatile int waitStatus;
    // 前驱节点
    volatile Node prev;
    // 后继节点
    volatile Node next;
    // 获取同步状态的线程
    volatile Thread thread;
    // 下一个condition队列等待节点
    Node nextWaiter;
    // 是否是共享模式
    final boolean isShared() {
        return nextWaiter == SHARED;
    }
    // 返回前驱节点或者抛出异常
    final Node predecessor() throws NullPointerException {
        Node p = prev;
        if (p == null)
            throw new NullPointerException();
        else
            return p;
    }

    Node() {    // Used to establish initial head or SHARED marker
    }
    Node(Thread thread, Node mode) {     // Used by addWaiter
        this.nextWaiter = mode;
        this.thread = thread;
    }
    Node(Thread thread, int waitStatus) { // Used by Condition
        this.waitStatus = waitStatus;
        this.thread = thread;
    }
}
```
### 核心方法
我们都知道CountDownLatch、CyclicBarrier、Semaphore、ReentrantLock这些工具类中，有的只支持独占，如ReentrantLock#lock()，有的支持共享，多个线程同时执行，如Semaphore。并且，从前文Node类的定义也可以看到
``` java
// 节点正在共享模式下等待的标记
static final Node SHARED = new Node();
// 节点正在以独占模式等待的标记
static final Node EXCLUSIVE = null;
```
AQS实现了两套加锁解锁的方式，那就是独占式和共享式。我们先看下独占式的实现，独占式的实现，就从ReentrantLock#lock()方法开始。
## ReentrantLock
![ReentrantLock.png](/mymd/imgs/60626d13-b497-4b77-866a-17160088cffeReentrantLock.png)
### lock
该方法定义如下
``` java
public void lock() {
    sync.lock();
}
```
其中sync是AbstractQueuedSynchronizer的实现，我们知道，ReentrantLock支持公平锁和非公平锁，其实现类分别是FairSync和NonfairSync，我们看看公平锁和非公平锁分别是怎么实现的
``` java
// FairSync 公平锁的实现
final void lock() {
    acquire(1);
}

// NonfairSync 非公平锁的实现
final void lock() {
    if (compareAndSetState(0, 1))
        setExclusiveOwnerThread(Thread.currentThread());
    else
        acquire(1);
}
```
cas方法compareAndSetState
``` java
//CAS，预期的的值是0，想要更新为1
protected final boolean compareAndSetState(int expect, int update) {//0,1
    //this：AQS队列同步器
    //stateOffset：资源变量，stateOffset内存的偏移量，也就是地址
    //expect：期盼值是0，他是默认值是0，所以肯定是为0
    //update：更新值是1
    return unsafe.compareAndSwapInt(this, stateOffset, expect, update);
}
```
可以看到，非公平锁的实现仅仅是多了一个步骤：通过CAS的方式(compareAndSetState)尝试改变state的状态，修改成功后设置当前线程以独占的方式获取了锁，修改失败执行的逻辑和公平锁一样。这就是公平锁和非公平锁的本质区别
### acquire
该方法定义如下
``` java
public final void acquire(int arg) {
    if (!tryAcquire(arg) &&
        acquireQueued(addWaiter(Node.EXCLUSIVE), arg))
        selfInterrupt();
}
```
该方法主要调用tryAcquire方法尝试获取锁，成功返回true，失败就将线程封装成Node对象，放入队列。
### tryAcquire
tryAcquire方法在AQS中并没有直接实现，而是采用模板方法的设计模式，交给子类去实现。我们来看公平锁的实现。
``` java
protected final boolean tryAcquire(int acquires) {
	// 当前线程
    final Thread current = Thread.currentThread();
    // 获取state状态，0表示未锁定，大于1表示重入
    int c = getState();
    if (c == 0) {
    	// 表示没有线程获取锁
        if (!hasQueuedPredecessors() &&
            compareAndSetState(0, acquires)) {
            // 没有比当前线程等待更久的线程了，通过CAS的方式修改state
            // 成功之后，设置当前拥有独占访问权的线程
            setExclusiveOwnerThread(current);
            return true;
        }
    }
    else if (current == getExclusiveOwnerThread()) {
    	// 独占访问权的线程就是当前线程，重入
    	// 此处就是【可重入性】的实现
        int nextc = c + acquires;
        if (nextc < 0)
            throw new Error("Maximum lock count exceeded");
        // 直接修改state
        setState(nextc);
        return true;
    }
    return false;
}
```
* 可以看到该方法就是以独占的方式获取锁，获取成功后返回true。从这个方法可以看出state变量是实现可重入性的关键。非公平锁的实现方式大同小异 
* acquire方法除了调用tryAcquire，还调用了acquireQueued(addWaiter(Node.EXCLUSIVE), arg)，这里分为两步，先看下addWaiter方法。
### addWaiter
该方法用于把当前线程封装成一个Node节点，并加入队列。方法定义如下
``` java
/**
 * Creates and enqueues node for current thread and given mode.
 * 为当前线程和给定模式创建并排队节点，给的的模式分为：
 * 1、Node.EXCLUSIVE：独占模式
 * 2、Node.SHARED：共享模式
 * 
 * @param mode Node.EXCLUSIVE for exclusive, Node.SHARED for shared
 */
private Node addWaiter(Node mode) {
	// 创建Node节点
    Node node = new Node(Thread.currentThread(), mode);
    // Try the fast path of enq; backup to full enq on failure
    // 尝试快速添加尾结点，失败就执行enq方法
    Node pred = tail;
    if (pred != null) {
        node.prev = pred;
        // CAS的方式设置尾结点
        if (compareAndSetTail(pred, node)) {
            pred.next = node;
            return node;
        }
    }
    // 快速添加失败，执行该方法
    enq(node);
    return node;
}
```
enq方法定义如下
``` java
/**
 * Inserts node into queue, initializing if necessary. See picture above.
 * 将节点插入队列，必要时进行初始化
 * 
 * @param node the node to insert
 * @return node's predecessor 
 */
private Node enq(final Node node) {
    for (;;) {
    	// 自旋
        Node t = tail;
        if (t == null) { // Must initialize
        	// 尾结点为空，队列还没有进行初始化
        	// 设置头节点
            if (compareAndSetHead(new Node()))
                tail = head;
        } else {
            node.prev = t;
            // CAS的方式设置尾结点，失败就进入下次循环
            // 也就是【自旋 + CAS】的方式保证设置成功
            if (compareAndSetTail(t, node)) {
                t.next = node;
                return t;
            }
        }
    }
}
```
* 可以看到该方法就是用来往队列尾部插入一个新的节点，通过自旋 + CAS的方式保证线程安全和插入成功。
* 需要注意的是，该方法返回的Node节点不是新插入的节点，而是新插入节点的前驱节点。
### acquireQueued
该方法定义如下
``` java
/**
 * Acquires in exclusive uninterruptible mode for thread already in
 * queue. Used by condition wait methods as well as acquire.
 *
 */
final boolean acquireQueued(final Node node, int arg) {
	// 操作是否成功
    boolean failed = true;
    try {
        boolean interrupted = false;
        for (;;) {
        	// 自旋
        	// 获取当前节点的前驱节点
            final Node p = node.predecessor();
            if (p == head && tryAcquire(arg)) {
            	// 前驱节点是头节点，并且已经获取了锁（tryAcquire方法在前文中详细讲解过）
            	// 就把当前节点设置成头节点（因为前驱节点已经获取了锁，所以前驱节点不用再留在队列）
                setHead(node);
                p.next = null; // help GC
                failed = false;
                return interrupted;
            }
            if (shouldParkAfterFailedAcquire(p, node) &&
                parkAndCheckInterrupt())
                // 如果前驱节点不是头节点或者没有获取锁
                // shouldParkAfterFailedAcquire方法用于判断当前线程是否需要被阻塞
                // parkAndCheckInterrupt方法用于阻塞线程并且检测线程是否被中断
                // 没抢到锁的线程需要被阻塞，避免一直去争抢锁，浪费CPU资源
                interrupted = true;
        }
    } finally {
        if (failed)
        	// 自旋异常退出，取消正在进行锁争抢
            cancelAcquire(node);
    }
}
```
### shouldParkAfterFailedAcquire
shouldParkAfterFailedAcquire方法定义如下，用于判断当前线程是否需要被阻塞
``` java
/**
 * Checks and updates status for a node that failed to acquire.
 * Returns true if thread should block. This is the main signal
 * control in all acquire loops.  Requires that pred == node.prev.
 *
 * @param pred node's predecessor holding status
 * @param node the node
 * @return {@code true} if thread should block
 */
private static boolean shouldParkAfterFailedAcquire(Node pred, Node node) {
	// 获取前驱节点的等待状态
    int ws = pred.waitStatus;
    if (ws == Node.SIGNAL)
        /*
         * SIGNAL表示后继节点处于等待状态，如果当前节点释放了锁或者被取消，会通知后继节点去运行
         * 所以作为后继节点，node直接返回true，表示需要被阻塞
         */
        return true;
    if (ws > 0) {
        /*
         * 前驱节点被取消了，需要从队列中移除，并且循环找到下一个不是取消状态的节点
         */
        do {
            node.prev = pred = pred.prev;
        } while (pred.waitStatus > 0);
        pred.next = node;
    } else {
        /*
         * 通过CAS将前驱节点的status设置成SIGNAL
         */
        compareAndSetWaitStatus(pred, ws, Node.SIGNAL);
    }
    return false;
}
```
### parkAndCheckInterrupt
parkAndCheckInterrupt方法定义如下，用于阻塞线程并且检测线程是否被中断
``` java
private final boolean parkAndCheckInterrupt() {
	// 阻塞当前线程
    LockSupport.park(this);
    // 检测当前线程是否被中断（该方法会清除中断标识位）
    return Thread.interrupted();
}
```
至此，独占锁的整个加锁过程就已经完成。再来回顾下整个流程
``` java
public final void acquire(int arg) {
    if (!tryAcquire(arg) &&
        acquireQueued(addWaiter(Node.EXCLUSIVE), arg))
        selfInterrupt();
}
```
首先执行tryAcquire方法用于尝试获取锁，成功后就直接返回，失败后就通过addWaiter方法把当前线程封装成一个Node，加到队列的尾部，再通过acquireQueued方法尝试获取同步锁，成功获取锁的线程的Node节点会被移出队列。

如果以上条件都满足，会执行selfInterrupt方法中断当前线程。

看完了独占锁的加锁，再来看看独占锁的解锁。同样从ReentrantLock入手
## unlock
方法定义如下
``` java
public void unlock() {
    sync.release(1);
}
```
我们已经知道了sync是AQS的实现，所以直接查看AQS中的release方法
``` java
/**
 * Releases in exclusive mode.  Implemented by unblocking one or
 * more threads if {@link #tryRelease} returns true.
 * This method can be used to implement method {@link Lock#unlock}.
 *
 * @param arg the release argument.  This value is conveyed to
 *        {@link #tryRelease} but is otherwise uninterpreted and
 *        can represent anything you like.
 * @return the value returned from {@link #tryRelease}
 */
public final boolean release(int arg) {
    if (tryRelease(arg)) {
    	// 尝试释放锁
        Node h = head;
        if (h != null && h.waitStatus != 0)
        	// 头节点已经释放，唤醒后继节点
            unparkSuccessor(h);
        return true;
    }
    return false;
}
```
### tryRelease
``` java
protected final boolean tryRelease(int releases) {
	// 计算剩余的重入次数
    int c = getState() - releases;
    if (Thread.currentThread() != getExclusiveOwnerThread())
        throw new IllegalMonitorStateException();
    // 是否完全的释放了锁（针对可重入性）
    boolean free = false;
    if (c == 0) {
    	// 表示完全释放了锁
        free = true;
        // 设置独占锁的持有者为null
        setExclusiveOwnerThread(null);
    }
    // 设置AQS的state
    setState(c);
    return free;
}
```
### unparkSuccessor
unparkSuccessor方法用于唤醒后继节点，其定义如下
``` java
/**
 * Wakes up node's successor, if one exists.
 *
 * @param node the node
 */
private void unparkSuccessor(Node node) {
   // 获取当前节点的状态
    int ws = node.waitStatus;
    if (ws < 0)
        compareAndSetWaitStatus(node, ws, 0);

    Node s = node.next;
    if (s == null || s.waitStatus > 0) {
    	// 当前节点的后继节点为null，或者被取消了
        s = null;
        for (Node t = tail; t != null && t != node; t = t.prev)
        	// 从尾结点查找状态不为取消的可用节点
            if (t.waitStatus <= 0)
                s = t;
    }
    if (s != null)
    	// 唤醒后继节点
        LockSupport.unpark(s.thread);
}
```