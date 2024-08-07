# JAVA多线程(7)
## Semaphore源码分析
### acquire
该方法是作用是请求一个许可，如果暂时没有可用的许可，则被阻塞，等待将来的某个时间被唤醒。因为Semaphore可以允许多个线程同时执行，所以可以看成是共享锁的实现。该方法定义如下
``` java
public void acquire() throws InterruptedException {
    sync.acquireSharedInterruptibly(1);
}
```
sync是AQS的实现，可以看到acquire方法底层调用的是acquireSharedInterruptibly方法。

在JDK中，与锁相关的方法，Interruptibly表示可中断，也就是可中断锁。可中断锁的意思是线程在等待获取锁的过程中可以被中断，换言之，线程在等待锁的过程中可以响应中断。

接下来看看acquireSharedInterruptibly方法的实现
### acquireSharedInterruptibly
``` java
public final void acquireSharedInterruptibly(int arg)
        throws InterruptedException {
    if (Thread.interrupted())
    	// 检测线程的中断中断状态，如果已经被中断了，就响应中断
    	// 该方法会清除线程的中断标识位
        throw new InterruptedException();
    if (tryAcquireShared(arg) < 0)
        doAcquireSharedInterruptibly(arg);
}
```
### tryAcquireShared
tryAcquireShared方法，相信大家已经能看出来，这里使用了模板方法模式，具体实现由子类去实现。Semaphore也实现了公平模式和非公平模式。公平的方式和非公平的方式实现逻辑大同小异。所以具体看下公平模式下的实现方式
``` java
protected int tryAcquireShared(int acquires) {
    for (;;) {
    	// 自旋
        if (hasQueuedPredecessors())
        	// 如果有线程排在自己的前面（公平锁排队），直接返回
            return -1;
        // 获取同步状态的值
        int available = getState();
        // 可用的（许可）减去申请的，等于剩余的
        int remaining = available - acquires;
        if (remaining < 0 ||
            compareAndSetState(available, remaining))
            // 如果剩余的小于0，或者设置状态成功，就返回，如果设置失败，则进入下一次循环
            // 如果剩余小于0，返回负数，表示失败
            // 如果设置状态成功，表示申请许可成功，返回正数
            return remaining;
    }
}
```
此处还是自旋 + CAS的方式保证线程安全和设置成功。
### doAcquireSharedInterruptibly
``` java
/**
 * Acquires in shared interruptible mode.
 * 在共享可中断模式下请求（许可）
 */
private void doAcquireSharedInterruptibly(int arg)
    throws InterruptedException {
    // 为当前线程和给定模式创建节点并插入队列尾部，addWaiter方法前文讲解过
    final Node node = addWaiter(Node.SHARED);
    // 操作是否失败
    boolean failed = true;
    try {
        for (;;) {
        	// 自旋
        	// 获取当前节点的前驱节点
            final Node p = node.predecessor();
            if (p == head) {
            	// 如果前驱节点是头节点，以共享的方式请求获取锁，tryAcquireShared方法前文讲解过
                int r = tryAcquireShared(arg);
                if (r >= 0) {
                	// 成功获取锁，设置头节点和共享模式传播
                    setHeadAndPropagate(node, r);
                    p.next = null; // help GC
                    failed = false;
                    return;
                }
            }
            if (shouldParkAfterFailedAcquire(p, node) &&
                parkAndCheckInterrupt())
                // 如果前驱节点不是头节点或者没有获取锁
                // shouldParkAfterFailedAcquire方法用于判断当前线程是否需要被阻塞，该方法前文讲解过
                // parkAndCheckInterrupt方法用于阻塞线程并且检测线程是否被中断，该方法前文讲解过
                // 没抢到锁的线程需要被阻塞，避免一直去争抢锁，浪费CPU资源
                throw new InterruptedException();
        }
    } finally {
        if (failed)
        	// 自旋异常退出，取消正在进行锁争抢
            cancelAcquire(node);
    }
}
```
### release
``` java
public void release() {
    sync.releaseShared(1);
}
```
### releaseShared
``` java
public final boolean releaseShared(int arg) {
    if (tryReleaseShared(arg)) {
        doReleaseShared();
        return true;
    }
    return false;
}
```
### tryReleaseShared
``` java
protected final boolean tryReleaseShared(int releases) {
    for (;;) {
    	// 自旋
    	// 获取同步状态的值
        int current = getState();
        // 可用的（许可）加上释放的，等于剩余的
        int next = current + releases;
        if (next < current) // overflow
            throw new Error("Maximum permit count exceeded");
        if (compareAndSetState(current, next))
        	// CAS的方式设置同步状态
            return true;
    }
}
```
可以看到此处依旧是自旋 + CAS的操作
### doReleaseShared
``` java
/**
 * Release action for shared mode -- signals successor and ensures
 * propagation. (Note: For exclusive mode, release just amounts
 * to calling unparkSuccessor of head if it needs signal.)
 */
private void doReleaseShared() {
    /*
     * Ensure that a release propagates, even if there are other
     * in-progress acquires/releases.  This proceeds in the usual
     * way of trying to unparkSuccessor of head if it needs
     * signal. But if it does not, status is set to PROPAGATE to
     * ensure that upon release, propagation continues.
     * Additionally, we must loop in case a new node is added
     * while we are doing this. Also, unlike other uses of
     * unparkSuccessor, we need to know if CAS to reset status
     * fails, if so rechecking.
     */
    for (;;) {
    	// 自旋
    	// 记录头节点
        Node h = head;
        if (h != null && h != tail) {
        	// 头节点不为null，且不等于尾结点，说明队列中还有节点
        	// 获取头节点等待状态
            int ws = h.waitStatus;
            if (ws == Node.SIGNAL) {
            	// 头节点等待状态是SIGNAL
                if (!compareAndSetWaitStatus(h, Node.SIGNAL, 0))
                	// 如果修改节点等待状态失败，进入下一次循环
                    continue;            // loop to recheck cases
                // 修改成功后，唤醒后继节点，unparkSuccessor前文讲过
                unparkSuccessor(h);
            }
            else if (ws == 0 &&
                     !compareAndSetWaitStatus(h, 0, Node.PROPAGATE))
                continue;                // loop on failed CAS
        }
        if (h == head)                   // loop if head changed
            break;
    }
}
```