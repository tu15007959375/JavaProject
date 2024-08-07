# 学习日记-cuda（6）
## cuda流
### **流和事件概述**
* 流能封装这些异步操作，并保持操作顺序，允许操作在流中排队。保证其在前面所有操作启动之后启动，有了流，我们就能查询排队状态了。
* 我们上面举得一般情况下的操作基本可以分为以下三种：
    * 主机与设备间的数据传输
    * 核函数启动
    * 其他的由主机发出的设备执行的命令
* 一个流中的不同操作有着严格的顺序。但是不同流之间是没有任何限制的。多个流同时启动多个内核，就形成了网格级别的并行。
* CUDA流中排队的操作和主机都是异步的，所以排队的过程中并不耽误主机运行其他指令，所以这就隐藏了执行这些操作的开销。
* 一般的生产情况下，内核执行的时间要长于数据传输,当重叠核函数执行和数据传输操作，可以屏蔽数据移动造成的时间消耗，当然正在执行的内核的数据需要提前复制到设备上的，这里说的数据传输和内核执行是同时操作的是指当前传输的数据是接下来流中的内核需要的。这样总的执行时间就被缩减了
* CUDA的API也分为同步和异步的两种：
  * 同步行为的函数会阻塞主机端线程直到其完成
  * 异步行为的函数在调用后会立刻把控制权返还给主机
### **CUDA流**
* 隐式声明的流，我们叫做空流,显式声明的流，我们叫做非空流
* 基于流的异步内核启动和数据传输支持以下类型的粗粒度并发
    * 重叠主机和设备计算
    * 重叠主机计算和主机设备数据传输
    * 重叠主机设备数据传输和设备计算
    * 并发设备计算（多个设备）
* 前面用的cudaMemcpy就是个同步操作，我们还提到过隐式同步——从设备复制结果数据回主机，要等设备执行完。当然数据传输有异步版本：
* `cudaError_t cudaMemcpyAsync(void* dst, const void* src, size_t count,cudaMemcpyKind kind, cudaStream_t stream = 0);`
* 值得注意的就是最后一个参数，stream表示流，一般情况设置为默认流，这个函数和主机是异步的，执行后控制权立刻归还主机，当然我们需要声明一个非空流：
* 给流命名声明流的操作应该是`cudaStream_t a;`
* `cudaError_t cudaStreamCreate(cudaStream_t* pStream);`
* 注意：执行异步数据传输时，主机端的内存必须是固定的，非分页的！！
* 主机虚拟内存中分配的数据在物理内存中是随时可能被移动的，我们必须确保其在整个生存周期中位置不变，这样在异步操作中才能准确的转移数据，否则如果操作系统移动了数据的物理地址，那么我们的设备可能还是回到之前的物理地址取数据，这就会出现未定义的错误。
* 在非空流中执行内核需要在启动核函数的时候加入一个附加的启动配置：
* `kernel_name<<<grid, block, sharedMemSize, stream>>>(argument list);`
* 前面我们为一个流分配资源，当然后面就要回收资源，回收方式：
* `cudaError_t cudaStreamDestroy(cudaStream_t stream);`
* 由于流和主机端是异步的，你在使用上面指令回收流的资源的时候，很有可能流还在执行，这时候，这条指令会正常执行，但是不会立刻停止流，而是等待流执行完成后，立刻回收该流中的资源。这样做是合理的也是安全的。
* 当然，我们可以查询流执行的怎么样了，下面两个函数就是帮我们查查我们的流到哪了：
* `cudaError_t cudaStreamSynchronize(cudaStream_t stream);`  
`cudaError_t cudaStreamQuery(cudaStream_t stream);`
* 这两条执行的行为非常不同，cudaStreamSynchronize会阻塞主机，直到流完成。cudaStreamQuery则是立即返回，如果查询的流执行完了，那么返回cudaSuccess否则返回cudaErrorNotReady。
### **流的优先级**
* 3.5以上的设备可以给流优先级，也就是优先级高的（数字上更小的，类似于C++运算符优先级）,优先级只影响核函数，不影响数据传输，高优先级的流可以占用低优先级的工作。
下面函数创建一个有指定优先级的流
* `cudaError_t cudaStreamCreateWithPriority(cudaStream_t* pStream, unsigned int flags,int priority);`
* 不同的设备有不同的优先级等级，下面函数可以查询当前设备的优先级分布情况：
* `cudaError_t cudaDeviceGetStreamPriorityRange(int *leastPriority, int *greatestPriority);`
### **CUDA事件**
* CUDA事件不同于我们前面介绍的内存事务，不要搞混，事件也是软件层面上的概念。事件的本质就是一个标记，它与其所在的流内的特定点相关联
* 事件的声明如下：`cudaEvent_t event;`
* 同样声明完后要分配资源：`cudaError_t cudaEventCreate(cudaEvent_t* event);`
* 回收事件的资源：`cudaError_t cudaEventDestroy(cudaEvent_t event);`
* 如果回收指令执行的时候事件还没有完成，那么回收指令立即完成，当事件完成后，资源马上被回收。
```
// create two events
cudaEvent_t start, stop;
cudaEventCreate(&start);
cudaEventCreate(&stop);
// record start event on the default stream
cudaEventRecord(start);
// execute kernel
kernel<<<grid, block>>>(arguments);
// record stop event on the default stream
cudaEventRecord(stop);
// wait until the stop event completes
cudaEventSynchronize(stop);
// calculate the elapsed time between two events
float time;
cudaEventElapsedTime(&time, start, stop);
// clean up the two events
cudaEventDestroy(start);
cudaEventDestroy(stop);
```
* 这段代码显示，我们的事件被插入到空流中，设置两个事件作为标记，然后记录他们之间的时间间隔。cudaEventRecord是异步的，所以间隔不准，这是特别要注意的。
### **流同步**
* 同步好处是保证代码有可能存在内存竞争的地方降低风险，第二就是相互协调通信，当然坏处就是效率会降低，原因很简单，就是当部分线程等待的时候，设备有一些资源是空闲的，所以这会带来性能损耗。
* 流分成阻塞流和非阻塞流，在非空流中所有操作都是非阻塞的，所以流启动以后，主机还要完成自己的任务，有时候就可能需要同步主机和流之间的进度，或者同步流和流之间的进度。
* 流的两种类型：异步流（非空流）,同步流（空流/默认流）
* 非空流并不都是非阻塞的，其也可以分为两种类型：阻塞流,非阻塞流
* 虽然正常来讲，非空流都是异步操作，不存在阻塞主机的情况，但是有时候可能被空流中的操作阻塞。如果一个非空流被声明为非阻塞的，那么没人能阻塞他，如果声明为阻塞流，则会被空流阻塞。
### **阻塞流和非阻塞流**
* cudaStreamCreate创建的是阻塞流，意味着里面有些操作会被阻塞，直到空流中默写操作完成。空流不需要显式声明，而是隐式的，他是阻塞的，跟所有阻塞流同步。
```
kernel_1<<<1, 1, 0, stream_1>>>();
kernel_2<<<1, 1>>>();
kernel_3<<<1, 1, 0, stream_2>>>();
```
* 上面这段代码，有三个流，两个有名字的，一个空流，我们认为stream_1和stream_2是阻塞流，空流是阻塞的，这三个核函数都在阻塞流上执行，具体过程是，kernel_1被启动，控制权返回主机，然后启动kernel_2，但是此时kernel_2 不会并不会马上执行，他会等到kernel_1执行完毕，同理启动完kernel_2 控制权立刻返回给主机，主机继续启动kernel_3,这时候kernel_3 也要等待，直到kernel_2执行完，但是从主机的角度，这三个核都是异步的，启动后控制权马上还给主机。
* 创建一个非阻塞流，因为我们默认创建的是阻塞版本：`cudaError_t cudaStreamCreateWithFlags(cudaStream_t* pStream, unsigned int flags);`
* 第二个参数就是选择阻塞还是非阻塞版本：`cudaStreamDefault;// 默认阻塞流
cudaStreamNonBlocking: //非阻塞流，对空流的阻塞行为失效。`
### **隐式同步**
* 隐式同步的指令其最原始的函数功能并不是同步，所以同步效果是隐式的，这个我们需要非常注意，忽略隐式同步会造成性能下降。所谓同步就是阻塞的意思，被忽视的隐式同步就是被忽略的阻塞，隐式操作常出现在内存操作上，比如：
* 锁页主机内存分布
* 设备内存分配
* 设备内存初始化
* 同一设备两地址之间的内存复制
* 一级缓存，共享内存配置修改
### **显式同步**
* 常见的同步有：同步设备，同步流，同步流中的事件，使用事件跨流同步
* 下面的函数就可以阻塞主机线程，直到设备完成所有操作：`cudaError_t cudaDeviceSynchronize(void);`,尽量少用，这个会拖慢效率。
* 流版本的，我们可以同步流，使用下面两个函数：`cudaError_t cudaStreamSynchronize(cudaStream_t stream);`  
`cudaError_t cudaStreamQuery(cudaStream_t stream);`
* 这两个函数，第一个是同步流的，阻塞主机直到完成，第二个可以完成非阻塞流测试。也就是测试一下这个流是否完成。
* 我们提到事件，事件的作用就是在流中设定一些标记用来同步，和检查是否执行到关键点位（事件位置），也是用类似的函数
```
cudaError_t cudaEventSynchronize(cudaEvent_t event);
cudaError_t cudaEventQuery(cudaEvent_t event);
```
事件提供了一个流之间同步的方法：`cudaError_t cudaStreamWaitEvent(cudaStream_t stream, cudaEvent_t event);`  
这条命令的含义是，指定的流要等待指定的事件，事件完成后流才能继续，这个事件可以在这个流中，也可以不在，当在不同的流的时候，这个就是实现了跨流同步。
### **可配置事件**
* CDUA提供了一种控制事件行为和性能的函数：`cudaError_t cudaEventCreateWithFlags(cudaEvent_t* event, unsigned int flags);`
* 其中参数是：`cudaEventDefault,cudaEventBlockingSync,cudaEventBlockingSync,cudaEventInterprocess`
* 其中cudaEventBlockingSync指定使用cudaEventSynchronize同步会造成阻塞调用线程。cudaEventSynchronize默认是使用cpu周期不断重复查询事件状态，而当指定了事件是cudaEventBlockingSync的时候，会将查询放在另一个线程中，而原始线程继续执行，直到事件满足条件，才会通知原始线程，这样可以减少CPU的浪费，但是由于通讯的时间，会造成一定的延迟。  
cudaEventDisableTiming表示事件不用于计时，可以减少系统不必要的开支也能提升    cudaStreamWaitEvent和cudaEventQuery的效率  
cudaEventInterprocess表明可能被用于进程之间的事件  