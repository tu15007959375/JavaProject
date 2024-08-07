# GDB调试日记
1. 调试带参数的程序，使用gdb --args ./xxx arg1 arg2 ...
2. r运行程序，b打断点，n下一步
3. l显示源代码内容（l xxx为显示某行附近的代码）（l xxx yyy）显示从xxx行到yyy行
4. c用于从一个断点跳至下一个断点
5. p为打印内容，可以打印变量，打印指针可以用p *xxx
6. 打印数组可以用p *xxx@num，xxx为数组名，num为打印数量
7. 打印结构体可以先设置set print pretty on，然后再p xxx
8. 进入函数体，先打断点，再r或者c。然后s回车就可进入