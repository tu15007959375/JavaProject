# SPMV稀疏矩阵向量乘笔记（23）
## Merge-based Parallel Sparse Matrix-Sparse Vector Multiplication with a Vector Architecture浅读 (1)
### **INTRODUCTION**
* 主要描述了spmv在每个领域的应用场景，表明spmv需要提升的必要性和重要性
* 向量架构（V ector architectures）是非常实用了，但是对于spmv而言，它在将部分结果合并到最终向量中的时间反而比乘法操作更多
* 并且spmv操作非常难以充分利用向量寄存器，因为它的数据存储是不规范的
* merge算法在于加速spmv在向量架构上的速度，2DMerge对中间向量进行分区，并在水平和垂直维度上进行合并，直到得到最终的稀疏向量
* 最后叙述该算法在什么算法上得到了什么样的加速比
### **PRELIMINARIES**
* 提出x向量可以使用位图模式（bitmap）来存储
* 在matrix-driven的spMspV中，A中的非零决定了计算和内存访问模式。而在vector-driven的spMspV中，根据向量x中的非零选择矩阵A中的特定列，然后将spMspV视为多个排序向量的归并。
* 使用CCS格式，并且使用位图表示非零，用dense vector存储非零元，list（idx，val）
* vector length:可以装入向量寄存器并由向量指令处理的数据量,当vector length长度短时，会严重限制系统性能和吞吐量。
### **RELATED WORKS**
* 主要是介绍spmv相关的工作
### **单词学习**
aforementioned a.上述的
On the strength of 凭借。。。的力量
traversal n.遍历
throttle v.掐，限制n.油门，马力