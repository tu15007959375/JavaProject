# SPMV稀疏矩阵向量乘笔记（6）
## spmv之oski优化
1. 首先了解一下csr的spmv代码实现，其中val为非零值，ind为列索引，ptr为行指针。  
![csrcode](/mymd/学习日记-spmv（6）/csrcode.png)
l是列值的一个索引，真正的列值是 。它和COO SpMV的一个明显区别是数据重用模式不同。 现在在内层循环 里被重用了，这意味着我们在代码生成时将其值放入一个寄存器中，然后在内层循环 中使用该寄存器而不用重复访问内存。此时内存循环每轮只需要3次memory loads。
2. 基于BSCR的spmv代码实现  
首先展示伪代码：
![bscrcode](/mymd/学习日记-spmv（6）/bscrcode.png)
下面是C语言代码：
![bscrCcode](/mymd/学习日记-spmv（6）/bscrCcode.png)
3. OSKI希望通过auto-tuning来解决的问题,即自动调优，调整分块大小