# SPMV稀疏矩阵向量乘笔记（14）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (1)（cuda代码）
### **main.cu**
* 120-155行：定义了矩阵的精度和输出矩阵文件名。通过VALUE_TYPE的长度，定义形式，通过make VALUE_TYPE=double或者float来定义。
* 156-199行：读取矩阵并确定矩阵格式，通过mmio库，例如mm_read_banner()就是读取矩阵数据的第一行来确定矩阵格式等等。（相关库说明网站如下：https://math.nist.gov/MatrixMarket/mmio-c.html）
  * 读取Matrix Market文件可以分为三个基本步骤：
    1. 使用mm_read_banner()处理文件的第一行并识别矩阵类型；
    2. 使用特定类型的函数，例如mm_read_mtx_crd_size()来跳过可选注释并处理矩阵规模信息；
    3. 使用fscanf()来读取数据，每行对应矩阵的一个元素。
* 200-251行：读取矩阵相关数据，使用fscanf来读取矩阵文件数据。
* （每行格式例（1 1 1474.779））。在231-232行因为idxi和idxy要减一的原因是，矩阵数据中是从1开始的，而数组中是从0。
* 代码中变量解释如下：m->矩阵行，n->矩阵列，nnzA_mtx_report->矩阵非零元个数，idxi->读到的矩阵行，idxy->读到的矩阵列，ival->读到的矩阵，csrRowPtrA_counter->存储矩阵中每行非零元个数。csrRowIdxA_tmp->依次存储非零元的行索引。csrColIdxA_tmp->依次存储非零元的列索引。
* 253-270行：对csrRowPtrA_counter从0到m-1存储的每行个数，值变为叠加形式，并且第一个数为0。例如（2,1,3->0,2,3,4）。nnzA->非零元个数，csrRowPtrA->即是csr格式的行指针。csrColIdxA->对应csr格式的列索引。csrValA->对应csr的值。
* 271-315行：猜测是矩阵中的数据是按照列存储的，然后要转为csr格式应该按照行存储，所以这几行代码应该就是完成转换的。
* 316-335行：将x和val的数据对10取余数，方便计算。并且为参数分配了相应的空间。
* 336-356行：使用cudaEventCreate和cudaEventRecord来测试时间和性能。并且按照行进行spmv操作。并且输出相应的是cpu时间和glops。
* 358行应该是使用csr5格式进行spmv操作。即函数call_anonymouslib，后续会继续解读。  
### **输出示例**
以下是示例输出，后续将不再展示：
PRECISION = 64-bit Double Precision  
--------------1138_bus.mtx--------------  
 ( 1138, 1138 ) nnz = 4054  
cpu sequential time = 0.059872 ms. Bandwidth = 1.58238 GB/s. GFlops = 0.135422 GFlops.  
Device [0] Tesla T4,  @ 1590MHz.   
omega = 32, sigma = 4.   
CSR->CSR5 malloc time = 0.060224 ms.  
CSR->CSR5 tile_ptr time = 0.027456 ms.  
CSR->CSR5 tile_desc time = 0.040384 ms.  
CSR->CSR5 transpose time = 0.025312 ms.  
CSR->CSR5 time = 0.23568 ms.  
CSR5-based SpMV time = 0.0185201 ms. Bandwidth = 5.11553 GB/s. GFlops = 0.437795 GFlops.  
Check... PASS!  