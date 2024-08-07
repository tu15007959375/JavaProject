# SPMV稀疏矩阵向量乘笔记（9）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 浅读 (2)
### **PRELIMINARIES**
1. 再给出了CSR5的存储格式的示例
![csr5](/mymd/学习日记-spmv（9）/csr5.png)
### **csr5存储格式**
1. 设计思路  
   * 将非零值数分为多个大小相同的2D的tile，tile的长和宽对应ω和σ，可以通过自行调整实现最佳效果
   * 添加了一个tile_ptr来描述每个tile的偏移量，用来与y_offset进行相加定位。
   * 添加了一个tile指针tile_ptr和一个tile，描述符tile_desc。然后另外三个就是csr的存储格式数组，不过是按照列优先存储的。
2. 自动调优ω和σ
   * ω即宽，为了使得SIMD单元充分利用，对于双精度类型（占64bit，即8字节），256bit的cpu设置ω=4，nVidia的gpus设置ω=32，amd的gpu设置ω=64，对于512bit的Intel Xeon设置ω为8
   * σ即长，对于CPUs and XeonPhi往往使用16和12.在gpu上，给出了如下图
   * ![gputoσ](/mymd/学习日记-spmv（9）/gputoσ.png)
3. 新增数组含义解释  
   * tile_ptr：大小为tile数量加1，为每个tile的第一个数所在的行数，并且当tile中有空行，将其值设置为负数，即相反数。（暂时还不理解为什么要加1，感觉tile的数量大小就足够用了）
   * tile_desc之y_offset：大小为列数，通过bit_flag数组中的T数量（每一行第一个为T）。数组第i个的值为前i行所拥有的T数量（i从0开始）
   * tile_desc之seg_offset：大小为列数，因为有些行非零元素过多，导致一个tile中，多列的数据其实还是同一行的，所以为了快速求分段和（不是很明白），就设计了该数组。数组第i个的值为该列的右列有多少列为全F。
   * tile_dsec之empty_offset：大小不确定，可能为0或者tile中segment的数量，即bit_flag中T的数量。当tile中没有空行，大小就为0。当有空行，代表了每个T所在第几行，即偏移值。
4. 相关数组生成伪算法
![tile_ptr](/mymd/学习日记-spmv（9）/tile_ptr.png)
![y_offset&seg_offset](/mymd/学习日记-spmv（9）/y_offset&seg_offset.png)
![empty_offset](/mymd/学习日记-spmv（9）/empty_offset.png)
![fast_segment](/mymd/学习日记-spmv（9）/fast_segment.png)
5. 存储相关细节
使用位域模式存储，对于tile_desc存储，三个新添加的数组只需要大约2%的额外空间。