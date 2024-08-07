# SPMV稀疏矩阵向量乘笔记（26）
## Merge-based Parallel Sparse Matrix-Vector Multiplication 浅读 (2)
### **MERGE-BASED CSRMV **
1. merge path
* 分为一个grid，x和y轴各为一个数组，从网格的左上角出发，达到右下角为终点，每次根据特定的决策算法决定是往下还是往右走
* ex：在每一步中，选择最小的并且尚未使用的数组元素。在此过程中，我们构建合并路径。再次参考图 1，从左上角开始，网格，即在 M[1,1]。 如果A[1]>B[1]，右移一位； 否则向下移动一个位置
* 性质定理如下：
    * 路径坐标描述了跨两个输入序列的元素比较和消耗的完整时间表
    * 如果两个值相同，优先选择A的项

![mergepath](/mymd/学习日记-spmv（26）/mergepath.png)
2. 基于csr-spmv的适应mergepath算法
* 该算法实际上并没有实际实现，只是为了引导csr矩阵均匀的分配
* 当向下移动，会积累矩阵向量的点积结果，当向右移动时，会将这些值刷新到y里面对应的行中，并且重置累加器
* 无论矩阵结构如何，都是在csrmv中等量划分
  
![csr-spmv-merge](/mymd/学习日记-spmv（26）/csr-spmv-merge.png)
3. CPU implementation 

![mergealg](/mymd/学习日记-spmv（26）/mergealg.png)
4. mergesearch

![mergesearch](/mymd/学习日记-spmv（26）/mergesearch.png)
### **单词学习**
hierarchical a.分层的