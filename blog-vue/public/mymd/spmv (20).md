# SPMV稀疏矩阵向量乘笔记（20）
## LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 浅读 (3)
### **PARALLELIZA TION USING CUDA**（写作思路）
1. 说明之前的spmv的静态行分配算法对于每行非零元个数变化较小的矩阵有较好的性能，但是当变化较大的时候，就会造成有些向量完成更早的情况。本文就此提出了两种动态行分配算法，分别是基于向量水平和基于wrap水平的。伪代码如图：
![code](/mymd/学习日记-spmv（20）/code.png)
2. 向量水平的动态行分配
   * 建立了一个数据结构GRM，它负责给每次处理完当前行的vector再分配新的行，row_counter存储着未处理的行中最小的行索引。
   * 在每次初始的时候，每个vector都有一个row，在处理完后，由vector中的第一个线程负责向GRM申请新的行，然后向同一个vector中的其他thread分发，并且计算y。
   * 然后考虑到可能存在多个thread会对row_counter同时访问，所以将对row_counter的操作设置为原子操作，并且赋予volatile关键字。并且使用shuffle函数在线程中更快的传递参数
   * threds为最大支持线程数量T，bolock的值为sm数量 x sm支持线程数 / T
   * 主机方面,计算了平均非零元，根据平均大小决定向量大小。如图
   ![vectorsize](/mymd/学习日记-spmv（20）/vectorsize.png)
   * gpu方面，对于矩阵A，开普勒架构的全局只读内存和纹理内存一样  
向量水平的伪代码如下：
![vectorcode](/mymd/学习日记-spmv（20）/vectorcode.png)
1. wrap水平的动态行分配
   * 考虑到，如果向量的大小很小时，例如为2，一个wrap中则需要32/2次原子操作，这些原子操作的时间可能会高于计算时间，这是我们不能接受的。所以提出了基于wrap层次的行分配
   * 相对于向量水平，有以下几个优点：①一个wrap只有一个原子操作②确保向量中分配的行是连续的③lane id越大则相应访问更大的行索引。