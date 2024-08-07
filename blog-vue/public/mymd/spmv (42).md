# SPMV稀疏矩阵向量乘笔记（42）
## 性能测试工具包 (2)
### **SpMV_GPU工具包配置**
* 首先是脚本文件的配置，思路为先做if判断是哪个算法然后依次调用即可，最后如果没指定算法，默认为全部
* 部分参数解释：
    * `$1,$2`：类似的是命令行参数，例如sh test.sh aaa bbb，此时`$1`就是aaa，而`$2`就是bbb
    * `${matirxpath}`：就是自定义变量，例如在第二行定义了一个变量，使用它的时候就是用该代码
    * `"\e[36m\e[0m"`：指定echo的颜色，即输出到终端的字符颜色，中间可以添加自己需要输入的文字
* 该脚本example：`sh test.sh merge 1138_bus`或`sh test.sh 1138_bus`
```
#！/bin/bash
#filename:test.sh
matirxpath="/home/public/matrixdata"
dev=4
#light spmv
if [ $1 = 'light' ]
then
    echo "\e[36m----------------------------light---------------------------------- \e[0m"
    ./LightSpMV-1.0/lightspmv -g "${dev}" -i "${matirxpath}"/$2.mtx
elif [ $1 = 'merge' ]
#merge spmv
then
    echo "\e[36m----------------------------merge---------------------------------- \e[0m"
    cd merge
    ./gpu_spmv --device="${dev}" --mtx="${matirxpath}"/$2.mtx
elif [ $1 = 'csr5' ]
#csr5 spmv
then
    echo "\e[36m----------------------------csr5----------------------------------- \e[0m"
    ./csr5/spmv "${dev}" "${matirxpath}"/$2.mtx
else
    echo "----------------------------$1----------------------------------"
    # echo "\e[36m----------------------------light---------------------------------- \e[0m"
    ./LightSpMV-1.0/lightspmv -g "${dev}" -i "${matirxpath}"/$1.mtx
    # echo "\e[36m----------------------------csr5----------------------------------- \e[0m"
    ./csr5/spmv "${dev}" "${matirxpath}"/$1.mtx
    # echo "\e[36m----------------------------merge---------------------------------- \e[0m"
    cd merge
    ./gpu_spmv --device="${dev}" --mtx="${matirxpath}"/$1.mtx
fi
```
* 设定结束该脚本后，还需要设置一个读取矩阵名的脚本，因为如果要测试大量数据的话，不可能一个一个数据输入
* done后面为文件名，然后上面是一个while循环，循环输出读取到的每行的值
* 只需要修改输出行，即echo，为`	sh test.sh $line`即可调用上面的脚本了
```
#！/bin/bash
#filename:runlist.sh
 while read line
 do
	echo $line
 done <  filename
```
* 后续想法是将输出的信息重定向到文件中，发现有数据并没有全部输入进去，还有部分依旧在命令行输出，初始的重定向代码为：`sh runlist.sh>res.out`,百度后发现是格式输出的问题
```
cmd > file 把 stdout 重定向到 file 文件中；

cmd >> file 把 stdout 重定向到 file 文件中(追加)；

cmd 1> fiel 把 stdout 重定向到 file 文件中；

cmd > file 2>&1 把 stdout 和 stderr 一起重定向到 file 文件中；

cmd 2> file 把 stderr 重定向到 file 文件中；

cmd 2>> file 把 stderr 重定向到 file 文件中(追加)；

cmd >> file 2>&1 把 stderr 和 stderr 一起重定向到 file 文件中(追加)
```
* 只需要修改为`sh runlist.sh>res.out 2>&1`即可