# SPMV稀疏矩阵向量乘笔记（38）
## AlphaSparse: Generating High Performance SpMV Codes Directly from Sparse Matrices浅读 (1)
### **Introduction**
* 数十种格式的提出，主要是为了以下几点：减少访存，提升负载均衡，减少GPU线程发散，，，
* 该文将这些格式分为三类：源格式（root formats），衍生格式（derived formats），混合格式（hybrid formats）
* root格式中有：coo，csr，ell，dia
* 衍生格式有：bcoo（bolck），csr5，sell（sliced）等等
* 混合格式有：hyb，cockall，csx等等
* 因为矩阵特征的不同以及机器架构的区别，很难找到一种适用全部矩阵的格式，所以需要自动发调优格式又出现了，例如smat，clspmv等等
* 从当前state of art的论文中总结出三个限制spmv性能的核心问题：①稀疏矩阵越来越多，导致矩阵特征十分丰富②稀疏矩阵的不规则分布，不规则矩阵：行长度方差大于100③传统的自动调优的局限性：只会选择一种格式-内核组合，但是其他可能存在但尚且没被发现的格式内核被忽略
* 而AlphaSparse解决了这个问题，旨在创造一个机器设计的spmv程序，该程序超越了人类的实践范围、人工格式、以及传动的自动调优方法
* 实现方法为：在原始设计空间中进行三个维度的搜索：格式、计算核心、参数（前两个维度的相关参数），提出了一种新的model：operator graph，在该模型中，每个operator代表了spmv的计算策略，而且是同时在三维空间中移动，实现了传动调优方法无法达到的设计

![compare-autotunning](/mymd/学习日记-spmv（38）/compare-autotunning.png)
* 要实现它，需要面临三个挑战：
    * 首先是该方法的时间复杂度远远高于传统的，假设A为已有的存储格式，并且它们都拥有相应的计算核心，那么传动的方式就是O(A)，而该方法为O(A^p)，p为存在的路径数
    * 其次是集成建模，从当前的spmv方法中提出设计策略并且统一管理是非常重要的工作
    * 最后是如何将传统方式改为投影到三维空间的方式
    * AlphaSparse为了解决这些挑战，有三个重要的组件：Designer, Format & Kernel Generator, and Search Engine
* Designer & Format & Kernel Generator：将operator graphs作为输入参数，并且输出相应的格式和spmv计算内核
* Search Engine：找到一种高性能的opertor graph