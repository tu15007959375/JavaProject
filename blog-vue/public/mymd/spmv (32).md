# SPMV稀疏矩阵向量乘笔记（32）
## yaSpMV: Yet Another SpMV Framework on GPUs  浅读 (3)
### **An Efficient Matrix-based Segmented Sum/Scan for SpMV**
* 基于上述的两个格式，分为三个步骤：
    * 根据col_index数据将读入的矩阵数据进行相乘
    * 使用bit_flag数组进行分段扫描算法
    * 将结果写回到全局内存
* 分段扫描方法示例

![segment](/mymd/学习日记-spmv（32）/segment%20scan.png)
* 使用bitflag，可以节约许多内存并且节省时间
* 存在跨越多个线程的非零元行，所以需要一个临时内存来存储部分和，在最后使用adjacent synchronization来解决同步问题

![method1](/mymd/学习日记-spmv（32）/method1.png)
![method2](/mymd/学习日记-spmv（32）/method2.png)