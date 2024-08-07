# SPMV稀疏矩阵向量乘笔记（3）
## Speculative Segmented Sum for Sparse Matrix-V ector Multiplication on Heterogeneous Processors 浅读（2）
1. 介绍了两个不同的异构处理器，一种是最后一级cache是独立的，即cpu与gpu各自有一个cache。另外一种是最后一级cache是共享的，即cpu与gpu共享。如图  
![heterogeneous%20processor](/mymd/学习日记-spmv（3）/heterogeneous%20processor.png)
2. 提出协同处理器与异构处理器的区别。其中最大的区别就是协同处理器说到底cpu与gpu之间的数据传输还是用pci总线完成，但是异构处理器中两者都是共享同一个存储空间，不需要像协同处理器中数据复制什么的。
3. BS WT nonzero entries，B为一个线程组中线程束的数量，S为需要处理多少个连续的W*T非零实体。
4. 提出算法目的：一是分段描述符需要在运行时生成在on-chip memory中，目的是为了减少全局内存的负载；二是空行必须在两个自定义函数之前被识别出来并且处理掉；三是充分利用异构处理器的优点
5. 再而说明算法总的步骤，第一步推测处理阶段（speculative execution stage），第二阶段检测预测阶段（checking prediction stage）。第一阶段生成的y可能不正确，这里的不正确指的是条目的排列不正确。只需要重排即可。
## 单词积累
evenly adv. 平均地  
decompose v.分解  
thread-bunch n.线程束  
amortise v.分摊  