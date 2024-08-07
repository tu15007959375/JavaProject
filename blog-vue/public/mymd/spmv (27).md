# SPMV稀疏矩阵向量乘笔记（27）
## Merge-based Parallel Sparse Matrix-Vector Multiplication 源码解析 (1)
### **cpu_spmv.cpp-(1)**
1. main函数
    * 685-732：主要是调用的参数以及设置的默认值
    * 735-742：运行merge spmv测试
2. RunTests函数
    * CooMatrix类，其中主要是与矩阵相关信息的类
    * CooMatrix.InitMarket读取矩阵相关信息
    * 549-592：读取矩阵相关信息，并且进行相应的判断，例如非零元啥的
    * 594-595：将csc格式转换为csr格式
    * 597-608：将矩阵相关信息输出
    * 620-641：分配内存空间并且将x值赋为1
    * `SpmvGold`：计算相关答案，用于最后的验证
    * 647-651：mkl的spmv（`TestMklCsrmv()`）
    * 653-657：merge的spmv（`TestOmpMergeCsrmv()`）
    * 660-674：清空信息
### **输出示例**
```
Reading... Parsing... (symmetric: 0, skew: 0, array: 0) done. /gpfs/home/tujinxing1/data/circuit5M/circuit5M.mtx, 
         num_rows: 5558326
         num_cols: 5558326
         num_nonzeros: 59524291
         row_length_mean: 10.70903
         row_length_std_dev: 1356.61627
         row_length_variation: 126.67964
         row_length_skewness: 868.02862

CSR matrix (5558326 rows, 5558326 columns, 59524291 non-zeros, max-length 1290501):
        Degree 1e-1:    0 (0.00%)
        Degree 1e0:     5205090 (93.64%)
        Degree 1e1:     325350 (5.85%)
        Degree 1e2:     20298 (0.37%)
        Degree 1e3:     7568 (0.14%)
        Degree 1e4:     0 (0.00%)
        Degree 1e5:     14 (0.00%)
        Degree 1e6:     6 (0.00%)


        288 timing iterations


MKL CsrMV,      PASS
fp64: 0.0000 setup ms, 34.3763 avg ms, 3.46310 gflops, 36.571 effective GB/s


Merge CsrMV,    Using 32 threads on 32 procs
        PASS
fp64: 0.0000 setup ms, 12.5912 avg ms, 9.45489 gflops, 99.846 effective GB/s
```