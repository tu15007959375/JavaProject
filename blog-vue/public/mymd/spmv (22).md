# SPMV稀疏矩阵向量乘笔记（22）
## LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 源码解析 (2)
### **Options.cu**
* 包含了`#include <cusp/io/matrix_market.h>`
* `printUsage()`：输出相关信息
* `parseArgs()`：  
    * 42-98：解析输入的参数argc, argv，使用的是c语言的getopt函数
    * 99-110：检测矩阵名是否合法；getGPUs函数：获取gpu上的相关信息,使用`vector<pair<int32_t, struct cudaDeviceProp> > _gpus;`和`cudaGetDeviceProperties`
    * 111-168：加载矩阵数据、X和Y
* `loadMatrixMarketFile()`：
    * 175-210：使用`csr_matrix`创建csr矩阵，然后使用`read_matrix_market_file`读取矩阵数据，然后分配内存，并且使用`cudaMallocHost`来分配保留内存。
* `loadVector()`：用于加载x和y的向量文件并且赋值，即-x和-y，如何没有指定就默认x为1.0，y为0
* `getRowSizeVariance()`：输入矩阵的相关信息，行数、列数、行非零元平均个数
### **SpMV.cu**
* `loadData()`：
    * 122-132：定义是否使用纹理内存
    * 135-150：复制opt中的数据到gpu，`cudaMemcpyToSymbol()`功能为主机内存复制到常量设备内存
    * 151-213：加载矩阵相关数据，`vector<pair>>`将两个数据合成一个，类似于哈希表一样，用first和second定义
* `getSysTime()`：获取当前时间，在运算前后各获取一次，得出spmv的时间
* `spmvKernel()`：其中主要靠`SpMVFloatWarp()`实现，该函数中通过`_meanElementsPerRow`变量，即行平均非零元来决定`csr32DynamicWarp()`中的参数，该函数是主要实现spmv的核心
* 注：代码中许多`#ifdef FLOAT_USE_TEXTURE_MEMORY`，是用来判断是否使用纹理内存的，X向量可以决定是否存储在纹理内存中，即对x使用`const cudaTextureObject_t`还是` const T* __restrict`来修饰
### **SpMVCSR.h**
* `csr32DynamicWarp()`：
  * 62-78：计算id和广播row index
  * 81-132：spmv计算