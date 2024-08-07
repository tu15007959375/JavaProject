# SPMV稀疏矩阵向量乘笔记（29）
## Merge-based Parallel Sparse Matrix-Vector Multiplication 源码解析 (3)
### **gpu_spmv.cu**
* 673-722：初始化输入的参数
### **RunTests()**
* 与cpu中基本一样，其中主要调用的在`RunTest()`中
### **RunTest()**
* 498-515：转换矩阵格式并且打印矩阵信息
* 516-535：分配变量以及计算spmv用于校验的结果
* 539-556：分配gpu变量和赋值
* 558-578：计算merge spmv和cuSPARSE CsrMV和cuSPARSE HybMV
* 580-590：清理内存
### **TestGpuMergeCsrmv()**
* 383-398：先运行了一次spmv计算所需要的空间，然后用变量保存并且等待后续的分配
* 403-410：再次运行了一次spmv，用于warmup
* 418-434：spmv并且计算gflops
### **DeviceSpmv::CsrMV()->Dispatch()**
* 365-376：获取设备信息以及读取sm的数量，并且计算mergepath的数量
* 378-384：获取sm的相关信息，其中主要调用的是`cudaOccupancyMaxActiveBlocksPerMultiprocessor()`
* 386-407：设置计算所需信息，例如临时存储空间大小，每个block占据的items等等
### **spmv_kernel**
后续的代码太复杂，准备在真正准备研究的时候再看