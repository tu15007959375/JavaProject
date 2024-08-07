# 学习日记-cuda(5)
## 线程束洗牌指令
### **shfl**
`int __shfl(int var,int srcLane,int width=warpSize);`
* srcLane这个线程的，srcLane并不是当前线程的束内线程，而是结合with计算出来的相对线程位置，比如我想得到3号线程内存的var值，而且width=16，那么就是，0~15的束内线程接收0+3位置处的var值，也就是3号束内线程的var值，16~32的束内线程接收16+3=19位置处的var变量。这个是非常重要的，虽然有些困难，但是却相当灵活。width的默认参数是32.srcLane我们后面简单的叫他束内线程，注意我们必须心理明白只有width是默认值的时候，他才是真正的束内线程。

![shfl](/mymd/学习日记-cuda（5）/shfl.png)
### **shfl_up**
`int __shfl_up(int var,unsigned int delta,int with=warpSize);`
* 这个函数的作用是调用线程得到当前束内线程编号减去delta的编号的线程内的var值，with和__shfl中都一样，默认是32

![shfl_up](/mymd/学习日记-cuda（5）/shfl_up.png)
### **shfl_down**
`int __shfl_down(int var,unsigned int delta,int with=warpSize);`
![shfl_down](/mymd/学习日记-cuda（5）/shfl_down.png)
### **shfl_xor**
`int __shfl_xor(int var,int laneMask,int with=warpSize);`
* 如果我们输入的laneMask是1，其对应的二进制是 000⋯001,当前线程的索引是0~31之间的一个数，那么我们用laneMask与当前线程索引进行抑或操作得到的就是目标线程的编号了，这里laneMask是1，那么我们把1与0~31分别异或

![shfl_xor](/mymd/学习日记-cuda（5）/shfl_xor.png)