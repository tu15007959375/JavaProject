# SPMV稀疏矩阵向量乘笔记（21）
## LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 源码解析 (1)
### **main.cu**
* 17->opt.parseArgs:获取参数（argc和argv）并且解析，其中是使用c语言的getopt函数，使用方式如下：`getopt(argc, argv, "i:x:y:o:g:f:r:d:m:\n")`
* 20opt._numIters：设置迭代次数
* 23-48：判断单双精度，以及判断基于vector还是wrap优化
* 50-56：设置gpu缓存
* 63-67：加载矩阵相关数据
* 69-97：开始spmv并且计算gflops
### **比较对象**
* 与cusp中的的spmv比较
* 与cusparse中的spmv比较（详细的cusparse学习在cusparse分类中）
### **运行结果示例**
Require GPUs with compute capability >= 3.5
GPU 0: Tesla T4 (capability 7.5)
GPU 1: Tesla T4 (capability 7.5)
loading sparse matrix
Initialize each element of vector X to 1.0
Initialize each element of vector Y to 0
Use single-precision floating point
Rows: 121192 Cols: 121192 Elements: 2624331 Mean: 22 Standard deviation: 14
Average runtime: 0.000156615 seconds (in 1000 iterations)
Total FLOPs: 5491046
GFLOPS: 35.0608


