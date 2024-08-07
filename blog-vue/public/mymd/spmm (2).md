# SPMM稀疏矩阵乘笔记（02）
## A Framework for General Sparse Matrix-Matrix Multiplication on GPUs and Heterogeneous Processors 浅读 (2)
### **Preliminaries**
spgemm伪代码如下：
![spgemm](/mymd/学习日记-spmm（2）/spgemm.png)
下面介绍了一系列的spgemm算法，略看了一下，等以后再做了解。
### **Performance Considerations**
1. 首先提出了spgemm和稠密矩阵乘和spmv不同的是，这两个都可以给结果矩阵预分配精确的矩阵内存空间，但是spgemm在计算前，并不知道结果矩阵中非零元的数量，所以不可能给结果矩阵分配精确的内存，并且每个结果矩阵中的非零元的位置也是不确定的。为了结果这个问题，提出了四种解决办法（综述）：  
   * precise method（精确方法）:以相同的计算模式简化spgemm，可以将浮点计算换成布尔计算，这样效率就会快很多，并且精确的知道了结果矩阵非零元的数量。例如：cuSPARSE and MKL
   * probabilistic method（概率统计方法）：对输入矩阵进行随机抽样和概率分析，估计出一个不精确的nnz（C），即结果矩阵的非零元数量。因为不能保证结果矩阵的安全下界，并且如果预估失败需要重新分配内存，所以该方法一般用于估计多个稀疏矩阵乘法的最短执行时间
   * upper bound method（上界方法）：直接计算C的非零元上限。![upper](/mymd/学习日记-spmm（2）/upper.png),这个方法往往会生成更大的中间矩阵，需要更多的内存，可能导致中间矩阵无法装入全局内存中。ESC算法就是采用的该方法。
   * progressive method（渐进方法）：先分配适当大小的内存，如果需要更多，就再分配。一些库中采用的该方法。
2. 综合方法2和方法4，提出了一种混合方法。不过在gpu上方法4并不好实现，尽管现代GPU设备能够在内核运行时分配设备全局内存，但它们仍然不能在无需退出当前流程来分配内存。on the fly（无需退出当前流程来做某件事，随手）
3. 在并行插入操作方面，主要提出了两点，第一点在算法的第四行，因为使用的是csr格式，所以是顺序执行的，可以使用simd。第二点，因为归并排序在join-merge操作方面更优于哈希排序。所以就是找到一个更快的归并算法。
4. 负载均衡方面，提出基于输入矩阵使用空间分解的方法分数据并不会实现高效的负载均衡，只有一个特定情况下，就是在大规模分布式存储系统中的大型稀疏矩阵时。于是提出基于输出矩阵的空间分解方法。总体来说就是分解中间矩阵的数据。
