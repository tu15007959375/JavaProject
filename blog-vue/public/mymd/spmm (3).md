# SPMM稀疏矩阵乘笔记（03）
## A Framework for General Sparse Matrix-Matrix Multiplication on GPUs and Heterogeneous Processors 浅读 (3)
### **Methodology**
1. 文中spgemm框架分为四个部分：  
    1. 计算上边界（calculating upper bound）
    2. 数据分箱（binning）
    3. 计算结果矩阵（computing the resulting matrix）
    4. 数据重组（arranging data）  
![spgmm%20framework](/mymd/学习日记-spmm（3）/spgmm%20framework.png)
2. 第一步，计算上边界。从A矩阵的每一行开始，寻找非零元aij，然后从bj*中寻找非零元，循环加上它的个数。
![upper%20bound](/mymd/学习日记-spmm（3）/upper%20bound.png)
3. 第二步，数据分箱。根据每行非零元的数量分成38个箱子，并且分为五组，第一组为行非零元个数为0的一个箱子，第二组为行非零元1的一个箱子，第三组为31个箱子，包括行非零元为2-32的个数，第四组为4个箱子，包括33–64, 65–128, 129–256和257–512的行非零元。第五组为大于512的。第三组每行分配一个线程。第四、五组每行分配一个线程组（在intel中是一个wrap）。并且对于前四个组，使用上限方法。而第五组使用累进方法，即progressive method。
4. 第三步，计算。一二组直接计算。其他三组如上图。（先生成中间矩阵的非零元个数，再计算）注：其中计算方法没有做了解，所以跳过了，后续看情况补上。
5. 第四步，数据重组。先计算中间矩阵的非零元个数，然后给结果矩阵分配空间。再把数据复制过来。对于组1中的行，不需要复制操作。对于组2中的行，为每行使用一个线程。对于组3-5中的其余行，为每行使用一个线程组。
### **Evaluating GPU Merge algorithms**
这里都是各种合并算法的比较和简介，目前暂时不往这方向看，后续用到的时候可以看看。