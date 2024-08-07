# SPMV稀疏矩阵向量乘笔记（11）
## NUMA-Aware Optimization of Sparse Matrix-Vector Multiplication on ARMv8-based Many-Core Architectures 浅读
### **读论文论前需要了解的知识**
1. 多核（Muticore）与众核（Manycore）的区别
![manycoreandmuticore](/mymd/学习日记-spmv（11）/manycoreandmuticore.jpg)
Manycore：core数量多，单线程的性能可能不高，为并行计算做了优化，高吞吐；
Multicore：core数量较少，单线程性能高，为并行和串行计算都做了优化；
2. NUMA架构
![numa](/mymd/学习日记-spmv（11）/numa.png)
### **Introduction**
1. 提出当前numa架构是不可避免地选择，但是有一个问题是，当发生跨numa访问时，会发生明显的较低带宽和较大的延迟。
2. 使用超图划分工具（hypergraph partitioning tools）将输入的矩阵进行重组（将非零元组织在对角线块上），然后将矩阵的按照行块方式分给不同的numa节点，并且分配对应的x。然后将线程绑定好numa节点进行spmv操作。
### **Background**
1. Phytium 2000+架构
![Phytium 2000+](/mymd/学习日记-spmv（11）/Phytium 2000+.png)
右侧显示了Phytium 2000+的面板结构。可以看到，每个面板有8个小米核，每个核分别有一个32KB的私有L1缓存用于数据和指令。每四个核组成一个核心组，共享一个2MB的L2缓存。Phytium 2000+的L2缓存采用包容性策略，即L1中的cacheline也存在于L2中
2. Hypergraph Partitioning超图划分
(a)大小为16x16的原始稀疏矩阵a  
(b)矩阵a的超图H的行-网表示，以及H的四向分区  
(c)矩阵a根据超图分区重新排序。可以看到，重新排序矩阵中的非零项被聚集到对角线块上，这意味着四个分区之间的连接数量减少了。
![Hypergraph Partitioning](/mymd/学习日记-spmv（11）/Hypergraph Partitioning.png)
3. NUMA-Aware SpMV Alogrithm
提出传统的spmv算法对x的访问并不规则，这会大大降低整体性能。针对于numa架构，将一组行以及这些行最需要的部分x存储在同一个numa节点上，这样就会带来一定程度的性能提升。
![spmv](/mymd/学习日记-spmv（11）/spmv.png)
### **Conclusions**
提出了一种numa感知的SpMV方法，并在Phytium 2000+处理器上对15个代表性稀疏矩阵进行了基准测试。实验结果表明，方法可以显著优于经典的OpenMP SpMV方法，生成的超图分区的数量对SpMV性能有显著的影响。