# SPMV稀疏矩阵向量乘笔记（16）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (3)（avx2/512代码）
### **main.cu**
在main中几乎一模一样，唯一不同的是就是多了个for循环，五次，里面A.asCSR5和A.asCSR依次执行，猜测是为了将部分数据放入cpu的缓存中，使得计算更快。
### **anonymouslib_avx2.h**
其中的函数与cuda的基本一致，下面详细介绍spmv函数
* 首先是调用参数，alpha应该是一个向量和的比例值，在这里默认为1。y就是用来存放结果的地方了。
* csr5_spmv是spmv函数里面调用的函数。
### **csr5_spmv函数**
首先展示参数图
![csr5_spmv_para](/mymd/学习日记-spmv（16）/csr5_spmv_para.png)
* _csr5_sigma为tile的长，在本例中为16
* _p为tile的数量，即输出中的partition
* _m为为稀疏矩阵长
* _bit_y_offset，计算y_offset中每一位需要多少位⌈log2 (ωσ)⌉
* _bit_scansum_offset，计算seg_offset中每一位需要多少位⌈log2 (ω)⌉
* _num_packet,将_bit_y_offset、_bit_scansum_offset和_csr5_sigma加起来，并且取一个字节的上限数量。_csr5_sigma为每列有多少行。与论文中Storage Details对应，即算出tile_desc中每一列的存储总共需要多少字节。
* _csr_row_pointer、_csr_column_index、_csr_value不再做过多解释
* 在生成指针时，有一个d_partition_pointer[par_id]& 0x7FFFFFFF运算，因为d_partition_pointer即为tile_ptr，有可能负数（负数代表有空行），与上0x7FFFFFFF为取int值的绝对值。
* _csr5_partition_pointer，对应tile_ptr
* _csr5_partition_descriptor_offset_pointer猜测为tile存在空行时，empty_offser的值
* _csr5_partition_descriptor_offset为其他offset的值
* _temp_calibrator为相关的验证
* _tail_partition_start为最后一个tile的指针。
### **csr5_spmv函数内部实现**（2023-1-31写）
![csr5_spmv_alg](/mymd/学习日记-spmv（16）/csr5_spmv_alg.png)
* 今天份遗留问题：(明天解决)
1. empty_offset的生成问题
2. empty_offset如何取代y_offset的问题
3. 源代码如何辨别是红、蓝、绿段的问题
### **输出示例**
( 1138, 1138 ) nnz = 4054
cpu sequential time = 0.043 ms. Bandwidth = 2.20326 GB/s. GFlops = 0.188558 GFlops.
omega = 4, sigma = 16. #partition = 64
CSR->CSR5 malloc time = 0.004000 ms
CSR->CSR5 tile_ptr time = 19.313000 ms
CSR->CSR5 tile_desc time = 10.583000 ms
CSR->CSR5 transpose time = 20.368000 ms
omega = 4, sigma = 16. #partition = 64
CSR->CSR5 malloc time = 0.002000 ms
CSR->CSR5 tile_ptr time = 3.990000 ms
CSR->CSR5 tile_desc time = 4.001000 ms
CSR->CSR5 transpose time = 4.000000 ms
omega = 4, sigma = 16. #partition = 64
CSR->CSR5 malloc time = 0.002000 ms
CSR->CSR5 tile_ptr time = 3.994000 ms
CSR->CSR5 tile_desc time = 4.001000 ms
CSR->CSR5 transpose time = 4.003000 ms
omega = 4, sigma = 16. #partition = 64
CSR->CSR5 malloc time = 0.001000 ms
CSR->CSR5 tile_ptr time = 3.994000 ms
CSR->CSR5 tile_desc time = 4.000000 ms
CSR->CSR5 transpose time = 4.001000 ms
omega = 4, sigma = 16. #partition = 64
CSR->CSR5 malloc time = 0.001000 ms
CSR->CSR5 tile_ptr time = 3.993000 ms
CSR->CSR5 tile_desc time = 4.001000 ms
CSR->CSR5 transpose time = 4.001000 ms
omega = 4, sigma = 16. #partition = 64
CSR->CSR5 malloc time = 0.001000 ms
CSR->CSR5 tile_ptr time = 3.994000 ms
CSR->CSR5 tile_desc time = 4.000000 ms
CSR->CSR5 transpose time = 4.001000 ms
CSR->CSR5 time = 12.006 ms.
CSR5-based SpMV time = 0.031485 ms. Bandwidth = 3.00905 GB/s. GFlops = 0.257519 GFlops.
Check... PASS!