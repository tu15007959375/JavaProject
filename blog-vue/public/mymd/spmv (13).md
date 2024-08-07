# SPMV稀疏矩阵向量乘笔记（13）
## TileSpMV: A Tiled Algorithm for Sparse Matrix-V ector Multiplication on GPUs 浅读 (2)
### **TILESPMV**
1. 两层存储结构分析
    * 第一层，tileptr数组，大小为tile的行数+1，代表tile的行偏移。tilecolldx数组，大小为tile的数量+1。tileNnz数组，大小为存储每个tile中的非零元个数差，可以理解为block-csr中的ptr。
    * 第二层，存储的是给tile的七种存储格式数组，并且额外加了一个xxxptr数组
![example](/mymd/学习日记-spmv（13）/example.png)
2. 计算方式，如图。（其中有一个tilewidth没看懂是干嘛的，后续看代码的时候再研究。）
![calexample](/mymd/学习日记-spmv（13）/calexample.png)
3. Tile-Wise SpMV算法
    * csr格式分配32个线程，每两个线程处理一行。
    ![csr](/mymd/学习日记-spmv（13）/csr.png)
    * coo格式按照非零元个数分配线程。
    ![coo](/mymd/学习日记-spmv（13）/coo.png)
    * ell格式分配32个线程
    ![ell](/mymd/学习日记-spmv（13）/ell.png)
4. 格式选择  
   * TileSpMV_CSR：默认csr格式
   * TileSpMV_ADPT：检测稀疏性，选择格式，如图
   *  TileSpMV_DeferredCOO：图问题中的非常稀疏矩阵的SpMV性能可能仍然不能令人满意。它们最明显的结构是COO格式为主
注：其中te和th代表了标准偏差与平均行长之比，来评估非零分布的平衡性。值越小，行间非零元素的数量越均衡
![selection](/mymd/学习日记-spmv（13）/selection.png)