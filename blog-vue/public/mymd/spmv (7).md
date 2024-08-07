# SPMV稀疏矩阵向量乘笔记（7）
## OpenMP循环调度算法及SpMV多核并行化研究 浅读
### spmv优化技术
1. 寄存器分块算法（其实就是BCSR格式的实现，并且寄存器重用），代码笔记6已经给出，下面给出BCSR案例。（block为2x3矩阵）
![example](/mymd/学习日记-spmv（7）/example.png)
寄存器分块的优点如下：
![blockadv](/mymd/学习日记-spmv（7）/blockadv.png)
2. 基于数据压缩的优化技术  
2.1 主要为因为col索引数组大小可预估->取决于矩阵的列数，可以通过压缩col数组，即例如一个列索引本用一个int值，现在可以使用一个int存储两个列索引。  
2.2 如果矩阵中非零元重复较多，也可以压缩非零值数组，不过这个压缩方法使得对非零元的访问变成了间接访问，但是在不同非零元个数较少的情况下，也可以提高访存效率，如图。  
![valzip](/mymd/学习日记-spmv（7）/valzip.png)
3. cache分块算法（与寄存器分块不同的是，cache块一般比较大，一般是基于csr格式的数组，将其分为Rcache*Rcache的小矩阵，然后在进行相应的计算，不过这方法也有一定的局限性，只对一部分特定的矩阵才有效）
![cache](/mymd/学习日记-spmv（7）/cache.png)
### spmv负载均衡策略
1. 基于非零元个数的行划分  
在openmp中，static策略一般是较好的性能，但是并不是负载均衡所想要的。因为最初的划分为给每个线程按照相同行数划分，使得线程计算时间长短不一。可以通过非零元个数进行划分。  
2. 列划分和二维划分  
列划分一般是基于csc划分，存储格式在之前已经给出，不再详细解释。二维划分的意思就是将大矩阵分为小矩阵进行计算，可以进一步改善负载均衡的情况。
