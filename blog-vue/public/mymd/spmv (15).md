# SPMV稀疏矩阵向量乘笔记（15）
## CSR5：An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector Multiplication 源码解读 (2)（cuda代码）
### **main.cu->call_anonymouslib函数**
* 21-58行：将计算spmv所需要的数据复制到gpu上
* 59-70行：将spmv相关操作封装成一个类，即anonymouslibHandle类，例如格式转换（csr->csr5）、进行spmv操作等。并且做好相关准备工作。
* 71-116行：进行spmv操作，并且进行计时、计算gflops、释放空间等操作。
* 主函数已经解读完毕，下面进入csr5格式具体实现内部。
### **anonymouslib_cuda.h**
* 模板类型ANONYMOUSLIB_IT，ANONYMOUSLIB_UIT，ANONYMOUSLIB_VT在本例中对应的如下，int，unsigned int，double。
* 分别有函数warmup，inputCSR，asCSR，asCSR5，setX，spmv，destroy，setSigma，computeSigma，spmv下面将一一解析。
1. warmup  
具体实现在format_cuda.h中的format_warmup，主要是分配thread和block。（中间有一个32*int字节的d_scan参数没看懂）
2. inputCSR  
将输入的矩阵数据赋值给类的内部变量
3. setX  
相关知识点:  
纹理内存的使用一共有两种方法：纹理参考和纹理对象。从功能上来说两者不存在任何区别，但是在使用上两者还是有略微区别的;  
目前所有的N卡都支持纹理参考，但是只有计算能力3.1以上的N卡才支持纹理对象;  
纹理参考的属性必须在代码编译前已知，作为全局变量使用，是不可更改的，并且不能作为参数使用；纹理对象则可以根据自己的需要在代码中灵活使用，可以作为核函数的参数传入，使用更加灵活。  
实现功能：  
将x复制给内部变量，并且将x的数据绑定到纹理对象，以便多次便捷的访问。
4. setSigma  
sigma为根据nnz/row的大小来决定，在论文中就是自动调优中的长。
5. asCSR5  
变量中omega为宽，sigma为长。
120-129行：计算y_offset和_bit_scansum_offset所需要的位数（二进制存储）  
130-153行：cuda数据分配与时间计算  
154-216行：分别生成tile_ptr，tile_desc，以及将行索引改为列索引操作。
6. asCSR  
将csr5中多余的数组释放掉即可。
7. spmv  
将在后续的源码分析中再分析。


