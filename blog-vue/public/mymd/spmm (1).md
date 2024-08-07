# SPMM稀疏矩阵乘笔记（01）
## A Framework for General Sparse Matrix-Matrix Multiplication on GPUs and Heterogeneous Processors 浅读 (1)
### **abstract**
对并行稀疏矩阵乘法提出了三点需要解决的问题：
1. 在生成的稀疏矩阵中，非零元的数量是未知的
2. 在生成的稀疏矩阵的随机位置上进行的并行插入操作占据了许多时间
3. 负载均衡方面必须同时考虑两个输入矩阵
为了解决上述三个问题，提出解决策略：
1. 结果矩阵的内存预分配
2. 通过合并路径算法（merge path）
3. 在必要的算法操作的基础上进行负载均衡操作
### **introduction**
针对当前存在的算法提出了两点问题，要么只适用于一些特定的稀疏矩阵，要么会带来额外的内存开销，为此论文展示了如下成果：
1. 提出通用的四阶段框架，该框架用于在多核上实现spgemm，即同构gpu和异构gpu
2. 提出一种混合的方法用于结果矩阵的内存预分配。短行分配有限内存，并逐步为长行分配内存
3. 快速合并进行并行插入操作，从五种gpu合并算法中选择出了gpu merge path算法
4. 基于启发式的负载平衡，是说将结果矩阵行分别分配啥的，没看懂= =，后续再看看把
