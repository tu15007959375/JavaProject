# SPMV稀疏矩阵向量乘笔记（35）
## Merge-based Parallel Sparse Matrix-Vector Multiplication 深读 (1)
### **分析merge性能优秀的原因**
1. 非常严格的负载均衡策略，每个线程都负责的基本相同的非零元元素个数
2. 未对CSR格式进行扩展，省去了大量的预处理时间
3. 对于gpu，使用了2D的merge，这正好对应bolck和thread的大小去划分，先将总item平均分给block，再在block中将item平均分给thread
4. 不过对于gpu，这需要两个级别的fix，这里可能是一个可以优化的点
5. gpu上关于划分数量问题，是根据gpu型号来决定每个线程要处理多少item(可能可以反过来？)


```
Using device 0: Tesla P100-SXM2-16GB (PTX version 350, SM600, 56 SMs, 1240 free / 16280 total MB physmem, 732.160 GB/s @ 715000 kHz mem clock, ECC off)
Reading... Parsing... (symmetric: 1, skew: 0, array: 0) done. /home/tujinxing/code/spmv/csr5/1138_bus.mtx,      50000 timing iterations

         num_rows: 1138
         num_cols: 1138
         num_nonzeros: 4054
         row_length_mean: 3.56239
         row_length_std_dev: 1.80218
         row_length_variation: 0.50589
         row_length_skewness: 2.22815

CSR matrix (1138 rows, 1138 columns, 4054 non-zeros, max-length 18):
        Degree 1e-1:    0 (0.00%)
        Degree 1e0:     1125 (98.86%)
        Degree 1e1:     13 (1.14%)




Merge-based CsrMV, Invoking spmv_kernel<<<{14,1,1}, 96, 0, 0>>>(), 4 items per thread, 19 SM occupancy
Invoking segment_fixup_kernel<<<{1,1,1}, 128, 0, 0>>>(), 3 items per thread, 16 SM occupancy
INCORRECT (sqrt_diff: 1448.15): [2]: 1.06581e-14 != 8.88178e-15 FAIL
fp64: 0.0000 setup ms, 0.0172 avg ms, 0.47134 gflops, 5.507 effective GB/s (0.75% peak)


cuSPARSE CsrMV, INCORRECT (sqrt_diff: 1448.15): [2]: 7.10543e-15 != 8.88178e-15 FAIL
fp64: 0.0000 setup ms, 0.0086 avg ms, 0.94175 gflops, 11.004 effective GB/s (1.50% peak)


cuSPARSE HybMV, INCORRECT (sqrt_diff: 1448.15): [2]: 7.10543e-15 != 8.88178e-15 FAIL
fp64: 2.2620 setup ms, 0.0346 avg ms, 0.23402 gflops, 2.734 effective GB/s (0.37% peak)
```