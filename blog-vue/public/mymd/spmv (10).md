# SPMV稀疏矩阵向量乘笔记（10）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 浅读 (3)
### **使用csr5格式进行spmv操作**
1. tile中的每一列都可以从bit_flag中提取信息，并将其局部数据中的段标记为三种颜色:(1)红色表示顶部未密封的子段，(2)绿色表示中间存在完全密封的子段，(3)蓝色表示底部未密封的子段。有一个例外，如果一个列从顶部和底部都被打开，它将被着色为红色。
![color](/mymd/学习日记-spmv（10）/color.png)
2. 伪代码如下，该操作还有几个注意事项  
* 考虑tile之间的同步，由于同一矩阵行可能会受到多个同时运行的2D tile的影响，一个tile的第一个和最后一个段需要通过原子添加
* 对于不是一个完整块中的最后一个项，我们在所有完整的tile被消耗后执行传统的CSR-vector方法
![code](/mymd/学习日记-spmv（10）/code.png)