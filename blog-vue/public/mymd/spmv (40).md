# SPMV稀疏矩阵向量乘笔记（40）
## AlphaSparse: Generating High Performance SpMV Codes Directly from Sparse Matrices浅读 (2)
### **FORMAT & KERNEL GENERATOR**
* Matrix Metadata Set：记录的是矩阵是如何变换的，包含了基础的矩阵信息、非零元信息、分块信息、归并信息等等，在一个算子计算完成后，set中的数据将累加算子对原始数据的影响
* Kernel Builder：总共两部分，第一部分是分发，选取并行策略以及归并策略，第二部分为归并，归并策略也可以选择多种
* Optimizer：在生成阶段，还实现了许多优化，例如删除不必要的代码，组合多个短数据类型数组等一个突出的优化是模型驱动的格式压缩，
### **SEARCH ENGINE**
* 因为搜索的空间范围非常大，所以搜索引擎提供了由粗到细的多层级搜索，通过粗粒度搜索来加速ML模型的细粒度搜索
* Operator Graph Search：分为三步①随机选择空操作符将它们连接到现有的操作符graph末尾实现枚举②粗粒度搜索算子参数，直接运行spmv得到算子图的性能③将第二步的测试结果通过ML模型插入到细粒度网格中
* 为什么不直接进行细粒度搜索，因为直接细粒度搜索的时间非常之久，并且负载也非常高
