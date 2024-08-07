# SPMV稀疏矩阵向量乘笔记（2）
## Speculative Segmented Sum for Sparse Matrix-V ector Multiplication on Heterogeneous Processors 浅读（1）
1. 摘要  
提出本文使用CSR格式的异构处理器算法  
2. 介绍  
2.1 提出了现在已经推出了许多新的存储格式，为什么还要用CSR  
2.2 现在许多工具包都是使用的CSR格式，新格式要加入这些工具包中并不简单  
2.3 如果程序需要重复格式转换，新格式可能会降低性能  
2.4 提出新存储格式不能仅仅看spmv的性能，还要把转化格式需要的成本和内存占用考虑进去  
2.5 如果spmv操作要与其他矩阵乘操作一起使用，新的格式可能就不太行  
2.6 CSR5格式基于CSR扩展，各项都优于CSR。但是当迭代次数较少，性能就没CSR基本格式好了  
2.7 分析分段求和法，有许多优势，但是不能识别空行，需要全局操作  
2.8 异构处理器的主要特点是统一的共享内存和不同类型内核之间的快速通信  
2.9 最后提出该论文方法使用specula-tively executing来加速，并且使用cpu重排结果向量。然后使用辅助信息改进了传统的分段方法，可以运行时识别空行。与row block方法对比，提升了吞吐量，与经典分段方法比，减少了全局开销并且消除了空行处理、预处理和后处理。 
3. 背景和动机  
3.1 介绍CSR格式，并且介绍了分块算法row block，因为每行非零元素的个数不确定，并且存在空行的原因，很难实现完美的负载均衡（load balance）,即使是用了向量化vectorization、数据流data streaming、内存合并memory coalescing、静态或动态分组static or dynamic binning、动态并行Dynamic Parallelism和动态行分布dynamic row distribution。  
3.2 介绍分段求和算法segmented sum，构建一个辅助数组segment descriptor，将每个非空行的第一个非零项标记为1(TRUE)，将其他非零项标记为0(FALSE)，ex[1,0,0,1,0,0]。然后product[i] = x[column index[i]] × value[i], i ∈ [0, nnz)，最后通过辅助数组来求和并且赋值给Y。  
## 单词积累
non-trivial a.非平凡的  
semantic a.语义的  
backward-compatibility n.向后兼容  
co-processors n. 协同处理器  
heterogeneous processors n.异构处理器  