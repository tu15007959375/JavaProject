# SPMV稀疏矩阵向量乘笔记（41）
## 性能测试工具包
### **SpMV_GPU工具包配置**
* 非root配置cuda环境，在cuda11之前，使用cuda提供的命令行勾选配置并不足以安装，因为部分文件的路径默认无法修改，需要使用`bash ./cuda_10.1.243_418.87.00_linux.run --toolkit --toolkitpath=xxx --defaultroot=xxx`来指定
* 安装完后，需要配置本地的~/.bashrc，此为配置环境变量，只要指定`export PATH=$PATH:/home/tujinxing/cuda-10.1/bin`和`export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tujinxing/cuda-10.1/lib64`，修改为自己安装cuda的目录即可
* 对于merge spmv、light spmv、csr5 spmv等都需要指定的gcc环境编译，需要在make文件中的`NVCC_FLAGS`处加上`-ccbin /home/xxx/gcc-7.5.0/bin`来指定自己需要的gcc版本，注：需要提前安装好相应的版本
* 工具包的想法为，将几种spmv算法放置于同级目录下，然后使用脚本文件来运行，在脚本文件中判断需要运行的算法，指定哪个gpu，以及数据集的路径