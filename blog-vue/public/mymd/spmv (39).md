# SPMV稀疏矩阵向量乘笔记（39）
## AlphaSparse: Generating High Performance SpMV Codes Directly from Sparse Matrices浅读 (2)
### **MOTIVATION**
* 1.人工格式和稀疏矩阵算法是被人类经验和搜索空间所限制，人类经验忽略了大部分有潜力的格式和内核
* 2.稀疏矩阵格式都是从源矩阵格式转换而来（ex：csr，ell，coo等等），因为每次一种新格式的提出都会描述它的转换步骤，这样就可以提出更多的组合来创建新格式，指的是可以通过采取常见的格式转换步骤来自动生成新格式
### **OVERVIEW**
* 在提出的Operator Graph中，每个opertor都是三维的探索组合以下信息：格式，kernel，参数，每个opertor都代表了kernel的信息，格式的设计，以及他们参数的配置，该模型中，不仅可以使用现有的格式，还能生成机器设计的格式
* AlphaSparse由search engine，a designer，a format&kernel generator组成

![consists](/mymd/学习日记-spmv（39）/consists.png)
* 首先稀疏矩阵用作输入，然后在搜索引擎中根据搜索规则进行枚举graph structure和operator parameters，并且将它们传输给designer，designer将会解析这些operators然后去修改Matrix metadata set，然后genertor根据opertor graph和metadata set生成kernel和format，最后将它们进行轻量级的机器学习模型训练，输出最好的spmv code
* 它不仅是一个调优器，而是在替代算法研究人员开发新的spmv格式和算法
### **DESIGNER**
* Opertor
    * spmv程序设计分为三步开发：首先定义矩阵的压缩内存布局，然后根据硬件单元以不同的并行层次去分发任务，最后设计kernel的实现，主要是规约操作。以上的每个阶段包括多个设计和优化策略，统称为opertor，因为工作量巨大，所以只考虑了gpu的opertor，将表中大部分opertor都设计成了以上的三个阶段
    * opertor即对应了三个阶段中各种不同的优化方法，例如重排，填充，使用sharememory等等

![opertors](/mymd/学习日记-spmv（39）/opertors.png)
![example](/mymd/学习日记-spmv（39）/example.png)
* Operator Graph
    * 以每个operator按照顺序连接的方式生成就是opertor graph，opertor（下面称为算子）之间也是有相应的依赖存在，意思是如果a和b算子之间存在依赖，使用了a就不能再使用b