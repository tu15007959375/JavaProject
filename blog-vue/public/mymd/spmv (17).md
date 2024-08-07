# SPMV稀疏矩阵向量乘笔记（17）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (4)（avx2/512代码）
* 昨天份遗留问题：
1. empty_offset的生成问题，以为为啥不能直接生成empty_offset来替代y_offset
* empty_offset是先计算bit_flag中T的位置，然后与row_ptr搜索来确定行数。而y_offset则是直接计算bit_flag的数量简单的叠加,所以y_offset并不能识别是否有空行.
* 因为y_offset生成成本低效率快,并且不用访问昂贵的全局内存row_ptr.
2. empty_offset如何取代y_offset的问题
* 读者的理解为,先通过row_ptr找出空行在第i行,然后通过empty_offset[ y_offset[ i ] ]替代
3. 源代码如何辨别是红、蓝、绿段的问题
* 首先考虑到线程是按照列进行处理,所以只需要分析一个列怎么区分就行了.
* 绿色是否存在只需要分析y_offset[ i-1 ]是不是大于等于2就行.
* 如果大于二,依次查找,可以设置一个flag标志,当有一个T设置为1,碰到另外一个T设置0.通过判断0和1区别为绿色还是蓝色.而如果第一个是T,那就没有红色.如果不是,那在碰到第一个T之前的一段就是红色.
* 然后再判断如果y_offset[ i-1 ]为0,证明为全F,所以为红色
* y_offset[ i-1 ]如果为1,如果第一个是T,那就是蓝色,如果不是第一个,那么就是前红后蓝.