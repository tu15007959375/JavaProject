# SPMV稀疏矩阵向量乘笔记（19）
## LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 浅读 (2)
### **BACKGROUND**（写作思路）
1. 介绍CSR格式
2. 说明CSR格式在cpu上表现好，但是gpu上性能不高，所以引出其他人提出的新格式
3. 再说明新格式替换存在的问题  
   * 因为许多已经存在的软件或者程序都是用CSR格式，完全替换新格式开销很大
   * 并且格式动态转换所需要的时间可能相当于数十到数百个SpMV操作
   * ELL格式适合SIMD操作，但是它的内存占用和与行数和最大行长度的乘积成正比
4. 存储开销
   * (R + 1 )的「log2(Nnz) bits存储row_offsets
   * 「log2(C) Nnz bits存储column_indices
   * bNnz bits存储values（b为32/64，看精度）
### **单词学习**
amortise V.摊销
memory footprint 内存占用