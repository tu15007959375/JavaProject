# SPMV稀疏矩阵向量乘笔记（28）
## Merge-based Parallel Sparse Matrix-Vector Multiplication 源码解析 (2)
### **TestMklCsrmv()**
* 460-473：正确性校验（之前算出了y的正确结果，使用mkl方法先验证一下是不是对的）
* 474-478：重复调用`MklCsrmv()`,（其中调用了`mkl_cspblas_scsrgemv()`,为intel的标准库）将需要的数据放入cache缓存
* 479-490：计算mkl的spmv时间和gflots
注：TestOmpMergeCsrmv函数中跟上述函数构造一样
### **OmpMergeCsrmv()**
* 308-312：计算总的merge长度，即长加宽，也是非零元+行数，`OffsetT items_per_thread    = (num_merge_items + num_threads - 1) / num_threads;`
* 315-321：计算每个线程开始和结束的坐标（row-idx, nonzero-idx）
* 324-333：首先通过MergePathSearch找到了每个线程的开始结束坐标，然后在该部分进行计算，先循环x，然后在x固定的情况下循环y，这就是向下的路径，而向下的路径终止条件是根据y值和rowoffsets的值大小判断，然后向右就是循环x
* 334-345：之前的代码是计算整行的和，因为y的终止条件为rowoffset，这几行计算rowoffset到yend，因为存在线程最后几个元素不是整行的非零元，而有一部分在下一线程，所以这一部分单独计算。
* 347-352：最后将一行的部分行加起来，并且存入数组
### **MergePathSearch()**
* 调用如下：`MergePathSearch(start_diagonal, row_end_offsets, nonzero_indices, a.num_rows, a.num_nonzeros, thread_coord);  MergePathSearch(end_diagonal, row_end_offsets, nonzero_indices, a.num_rows, a.num_nonzeros, thread_coord_end);`
* 通过二分查找来确定线程的开始和结束坐标，先min+max（x）>>1,即除以2，然后比较该点a和b的大小，来修改min和max，最终确定线程的开始结束坐标