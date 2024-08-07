# SPMV稀疏矩阵向量乘笔记（34）
## Performance Optimization Using Partitioned SpMV on GPUs and Multicore CPUs 浅读 (2)
### **A PROBABILISTIC MODEL**
1. PMF概率模型
    * 建立系数矩阵的概率模型
    * 根据概率模型和处理器计算能力对稀疏矩阵进行划分
2. 划分策略
    * 基于行数
    * 基于行的NNZ
    * 根据其PMF拆分A
    * 基于子矩阵  
    * 本文主要是基于第三种，它是基于第二种划分策略所改进（注：因为是异构，所以每个处理器的计算能力不同，所以需要根据计算能力划分非零元，ex：cp1占10，cp2占30，cp3占60）
    * 先将每一行分到b数组中，bi中所有行都有相同的非零元数量，算法2是根据A矩阵顺序划分，而算法3是根据bi顺序划分，这样每个块就具有极高的密度比例，减少了0的填充
### **IMPLEMENTATION OF SPMV ON GPUS AND MULTICORE CPUS**
![cpu+gpu](/mymd/学习日记-spmv（34）/cpu+gpu.png)
因为是异构，所以需要cpu和gpu同时执行计算，所以OpenMP专用一个线程来控制GPU，而其他线程用于在剩余的CPU内核之间共享工作负载。