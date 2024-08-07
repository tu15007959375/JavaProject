# SPMV稀疏矩阵向量乘笔记（8）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 浅读 (1)
### 介绍部分
1. 分析row block和segment sum算法，row block算法虽然效率高，但是不能实现很好的负载均衡。而segment sum算法虽然可以实现很好的负载均衡，但是需要更为昂贵的全局同步和全局内存。并且提出上述两种方法都不可避免需要预处理的负载，因为都需要生成一定的辅助数据来调节负载均衡。  
2. 提出新格式需要满足的条件：  
①通过避免依赖于结构的参数调优来限制格式转换的代价  
②应该支持规则与不规则的spmv  
### PRELIMINARIES
1. 给出两种算法的伪代码，并且比较了两种算法与csr5算法的性能。分析segment sum算法性能差的原因：第一步为生成bit_flag数组，第四步计算总和，都需要全局的内存同步和空间访问。并且有些研究正常segme sum算法与coo存储格式更为契合。因为coo保存了完整的非零元素行索引。有助于第一步和第四步。segment sum算法伪代码和案例如下图。  
![segment%20sum](/mymd/学习日记-spmv（8）/segment%20sum.png)
![segment%20sum%20example](/mymd/学习日记-spmv（8）/segment%20sum%20example.png)