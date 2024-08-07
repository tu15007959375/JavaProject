# 学习日记-latex(2)
## latex常用语法
### **无序列表**
代码示例如下：
```
\begin{itemize}
    \item this is first item
    \item this is second item
\end{itemize}
```
![1](/mymd/学习日记-latex（2）/1.png)
由`\begin{itemize}`开始，`\end{itemize}`结束
### **有序列表**
```
代码示例如下：
\begin{itemize}
  \item The individual entries are indicated with a black dot, a so-called bullet.
  \item The text in the entries may be of any length.
\end{itemize}
```
![2](/mymd/学习日记-latex（2）/2.png)
只需要改成`enumerate`即可
### **数学表达式**
* 总共分为两种模式，为内联（inline）模式和显示（display）模式，内联即为嵌入在语句内，而显示为独占一行
* 内联模式需要用以下定界符：`\(... \)`，`$ ... $`，`\begin{math}... \end{math}`

内联模式代码示例如下：
```
In physics, the mass-energy equivalence is stated
by the equation $E=mc^2$, discovered in 1905 by Albert Einstein.
```
![3](/mymd/学习日记-latex（2）/3.png)
显示模式分两种，编号与非编号，代码示例如下：
```
The mass-energy equivalence is described by the famous equation

\[E=mc^2 \]

discovered in 1905 by Albert Einstein.
In natural units ($c = 1$), the formula expresses the identity

\begin{equation}
E=m
\end{equation}
```
![4](/mymd/学习日记-latex（2）/4.png)
以下是一些常用的数学公式：
```
Subscripts in math mode are written as $a_b$ and superscripts are written as $a^b$. These can be combined an nested to write expressions such as

% 上标和下表分别用 $a_b$ 和 $a^b$，将它们组合起来使用可以写出下面的表达式。

\[T^{i_1 i_2 \dots i_p}_{j_1 j_2 \dots j_q} = T(x^{i_1},\dots,x^{i_p},e_{j_1},\dots,e_{j_q}) \]

We write integrals using $\int$ and fractions using $\frac{a}{b}$. Limits are placed on integrals using superscripts and subscripts:

% 我们使用 $\int$ 编写积分，使用 $\frac{a}{b}$ 编写分数。极限使用上标和下标放置在积分上：

\[\int_0^1 \frac{1}{e^x} =  \frac{e-1}{e} \]

Lower case Greek letters are written as $\omega$ $\delta$ etc. while upper case Greek letters are written as $\Omega$ $\Delta$.

% 小写希腊字母像这样写：$\omega$ $\delta$，大写希腊字母像这样写：$\Omega$ $\Delta$

Mathematical operators are prefixed with a backslash as $\sin(\beta)$, $\cos(\alpha)$, $\log(x)$ etc.

% 数学运算符的前缀为反斜杠，例如 $\sin(\beta)$, $\cos(\alpha)$, $\log(x)$ 等。
```
![5](/mymd/学习日记-latex（2）/5.png)
### **概要/摘要**
```
\begin{abstract}
This is a simple paragraph at the beginning of the
document. A brief introduction about the main subject.
\end{abstract}
```
![6](/mymd/学习日记-latex（2）/6.png)
### **段落和新行**
空一行就是新的一行，即一段
### **章节和分段**
```
\chapter{First chapter}
\section{Introduction}
it is my introduction
\section{motivation}
second section
\subsection{moti-1}
go go go
\section*{Un section}
```
![7](/mymd/学习日记-latex（2）/7.png)
其中`\chapter{First chapter}`代表一节即一章的开始，`\section{Introduction}`代表该章中的分段，`\subsection{moti-1}`代表该段中的再分类
### **表格**
```
\begin{center}
    \begin{tabular}{c c c}
       cell1 & cell2 & cell3 \\
 cell4 & cell5 & cell6 \\
 cell7 & cell8 & cell9
    \end{tabular}
\end{center}
```
![8](/mymd/学习日记-latex（2）/8.png)
ccc表示有散列，&为分隔符，换行用\\\,最开始的center是将表格居中
添加竖线分隔线方式：`|c|c|c|`  
添加横线分隔线方式：`\hline
 cell1 & cell2 & cell3 \\`  
 引用的方式与图片相同
```
Table \ref{table:data} is an example of referenced \LaTeX{} elements.

\begin{table}[h!]
\centering
\begin{tabular}{||c c c c||}
 \hline
 Col1 & Col2 & Col2 & Col3 \\ [0.5ex]
 \hline\hline
 1 & 6 & 87837 & 787 \\
 2 & 7 & 78 & 5415 \\
 3 & 545 & 778 & 7507 \\
 4 & 545 & 18744 & 7560 \\
 5 & 88 & 788 & 6344 \\ [1ex]
 \hline
\end{tabular}
\caption{Table to test captions and labels}
\label{table:data}
\end{table}
```
### **目录**
只需要使用`\tableofcontents`放在最开始即可，`\begin{document}
\maketitle
\tableofcontents`