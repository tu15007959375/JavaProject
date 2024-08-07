# SPMV稀疏矩阵向量乘笔记（5）
## Sparse Matrix-Vector Multiplication on GPGPUs 浅读
## 1. 介绍
简述了一下spmv的由来以及重要性和spmv的历史解决办法，例如非零填充等。然后介绍了gpgpu的发展以及解决了许多复杂的算法。gpgpu是simt结构，即单指令多线程结构。文章主要是对不同的存储格式做出了简单的介绍与性能测试。  
## 2. 关于spmv在gpgpu上的综述：
1. 提出优化方向  
1.1 应用新的存储格式，并且一般是经典格式（coo，csr，csc，ell，dia）的派生  
1.2 基于传统格式对体系结构的特定优化  
1.3 基于矩阵格式和参数的自动性能调优  
2. 介绍1.1中的扩展存储格式  
例如coo派生：ALIGNED_COO，SCOO（切片），BRO-COO（压缩coo的行索引），BCCOO（看不懂，基于块的方式减小IA和JA的尺寸，用位标志存储行索引）  
csr的问题：缺乏合并，负载不均衡，线程发散（许多线程空闲而有现线程忙）   

由于后面全是派生，就没再看下去了。看这篇文章的目的也只是为了了解spmv的发展趋势与整体框架。
## 单词学习
tradeoff n.权衡  
far from being unusual 这一点也不稀奇  
one-size-fits-all a.通用的
