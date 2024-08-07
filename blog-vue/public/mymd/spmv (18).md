# SPMV稀疏矩阵向量乘笔记（18）
## LightSpMV-FasterCSR-basedsparsematrix-vectormultiplicationonCUDA-enabledGPUs 浅读 (1)
### **INTRODUCTION**（写作思路）
* 先说明spmv在哪些领域得到应用，来以此表示spmv很重要。
* 说明稀疏矩阵和稠密矩阵的区别，稀疏矩阵的特点
* 提出为了提升效率，各种格式应运而生。CSR格式应用最为广泛
* 但是在gpu上，因为稀疏矩阵的不规格特点，所以需要探索底层的细粒度并行和内存访问形式等。
* 提出其他人的思路，以及不足之处
* 解释了一些通过行非零元的长度来分组的方法，并且说明这些方法实际上进行了轻量级的格式转换，但是与其他CSR替代方案相比，这种转换需要更少的运行时和更少的额外空间。
* 最后简单介绍了自己的方法
### **单词学习**
fine-grained a.细粒度的
harness v.控制，利用n.马具，吊带
analogous a.类似的
note that intrinsically 注意这一点