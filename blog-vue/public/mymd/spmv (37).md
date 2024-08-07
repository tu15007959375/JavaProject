# SPMV稀疏矩阵向量乘笔记（37）
## Selecting optimal SpMV realizations for GPUs via machine learning浅读 (1)
### **Introduction**
* 提出随着GPU在高性能的应用，需要计算都可以在gpu上非常高效的进行，并且也有很多人使用机器学习+gpu的方式在针对特定算法选用一些最优方法的应用
* 目前许多在GPU上的SpMV都是针对特定几组矩阵有着非常优越的性能，但是对于其他矩阵性能表现就不好
* 这主要是因为SpMV的效率与稀疏矩阵中非零元的分布息息相关，因为稀疏矩阵绝大部分都是0，所以在访问非零元的时候，需要非常跨越式的内存访问导致效率变低
* 还有一个主要原因是负载均衡的问题，如果没处理好，就会导致许多进程来等待某部分进程结束，就非常影响时间
### **Efficient Realizations of SpMV for GPUs**
* 对于上述问题，有两类解决方法
* 直接分配不同行到不同的计算单元，这样就可以避免一些计算单元都计算相同行的部分和
* 第一类方法当矩阵行中非零元分配非常不均衡，就会导致负载均衡问题，因为每个计算单元可能处理的非零元数目差别很大
* 第二类方法就是引入一些更复杂的同步和通信机制来使得负载更均衡
* 方法1：csrvector，2009，根据vector（2、4、8、16、32）线程来处理一行数据，由稀疏矩阵的平均非零元来取决于vector的大小
* 方法2：bhSparse,2015,将非零元平均分成大小相等的块，并且以tile为单位处理，如果包含非零元，则标记为脏行，存入临时存储后使用cpu来纠正
* 方法3：CSR-Adaptive，2014，将矩阵中行分为两种，一种为非零元较多的，一种为非零元较少的，较多的用csrvector处理，较少的行将它们聚成一个块，右csrstream处理
* 方法4：lightspmv，2015，与csrvector相似，会在运行时根据每行非零元动态调整vector大小，为了处理负载不均衡问题，在一个vector运行完后，每个vector的0号线程会从全局数据结构来获取行索引，然后广播到其他线程。这样可以适当的缓解一些vector计算完后空转的情况
* 方法5：Perfect-CSR，第一阶段启动的块数量等于非零条目数除以块尺寸(即每个非零条目一个线程)。每个线程将加载相应的非零值，将其乘以输入向量项，并将其存储在全局内存中的临时数组中。第二阶段启动与行数除以块维度(即每行一个线程)相同数量的块。第二阶段的第一步是将CSR行指针数组中对应于该块的部分组装到共享内存中。然后，每个线程将在第一阶段计算的临时数组的一些条目加载到每个线程块的共享内存中。
* 方法6：merge：之前的论文有分析过
* 方法7：MAGMA-Sparse SpMV，MAGMA在实现CSR格式的SpMV时使用cuSparse