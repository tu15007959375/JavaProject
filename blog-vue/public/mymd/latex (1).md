# 学习日记-latex(1)
## latex常用语法
### **编写第一个LATEX**
代码示例如下：
```
\documentclass{article}

\begin{document}
First document. This is a simple example, with no
extra parameters or packages included.

\end{document}
```
![firstLatex](/mymd/学习日记-latex（1）/firstLatex.png)

* `documentclass{article}`声明了文档的类型，为类（class），该例中类为article，还有其他例如book或report类
* 在`\begin {document}`和`\end {document}`中写入文档内容，为文档的主体（body）
### **序言**
* 在`\begin {document}`之前的内容都为序言（preamble），序言中，可以定义文档类型，语言，要使用的包

代码示例如下：
```
\documentclass[12pt]{article}
\usepackage[utf8]{inputenc}
\title{第一个latex}
\author{Tu jinxing}
\date{June 2023}
\begin{document}
\maketitle
First document. This is a simple example, with no
extra parameters or packages included.
\end{document}
```
![twoLatex](/mymd/学习日记-latex（1）/twoLatex.png)
* `\documentclass[12pt, letterpaper]{article}`定义了文档类型，[]中为字体大小和纸张尺寸，默认大小为`10pt`，纸张尺寸可以设置为`a4paper`和`Legalpaper`等
* `\usepackage[utf8]{inputenc}`指定了文档编码
* `\title{First document}`为文档标题
* `\author{Hubert Farnsworth}`为作者姓名
* `\date{February 2014}`为日期，也可以用`\today`命令，将在编译文档时自动更新日期
* 要在文档上打印这些信息，可以在主体部分使用`\maketitle`打印

### **注释**
```
\begin{document}
\maketitle
We have now added a title, author and date to our first \LaTeX{} document!

% This line here is a comment. It will not be printed in the document.

\end{document}
```
### **加粗、斜体和下划线**
代码示例如下：
```
Some of the \textbf{greatest}
discoveries in \underline{science}
were made by \textbf{\textit{accident}}.
```
![threeLatex](/mymd/学习日记-latex（1）/threeLatex.png)
* 加粗：`\textbf{greatest}`
* 斜体：`\textit{}`
* 下划线：`\underline{}`
* 强调文本命令：`\emph{...}`，在普通文本中，强调的文本为斜体，反之，在斜体文本中，文字为普通文本
### **添加图片**
代码示例如下：
```
\documentclass[12pt]{article}
\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\graphicspath{{images/}}
\title{第一个latex}
\author{Tu jinxing}
\date{June 2023}
\begin{document}
\maketitle
Some of the \textbf{greatest}
discoveries in \underline{science}
were made by \textbf{\textit{accident}}.
\includegraphics{head.png}
\end{document}
```
![fourLatex](/mymd/学习日记-latex（1）/fourLatex.png)
* 要添加图片，需要使用一个包（package），即`graphicx`
* `\graphicspath{{images/} }`，声明图片保存在当前目录下images的文件夹中
* `\includegraphics {universe}`，其中universe为不带扩展名的图片文件
### **标题、标签和引用**
```
Some of the \textbf{greatest}
discoveries in \underline{science}
were made by \textbf{\textit{accident}}
\begin{figure}[H]
    \centering
    \includegraphics[width=0.25\textwidth]
    {head}
    \caption{a test head}
    \label{fig:head}
\end{figure}

look it figure \ref{fig:head}
```
![fiveLatex](/mymd/学习日记-latex（1）/fiveLatex.png)
* `\caption{a nice plot}`：图片标题
* `\label{fig:mesh1}`：引用图片的标签
* `\ref{fig:mesh1}`：在编译后将显示替换为图片对应编号
* 注：若插入图片后，文字始终在图片上方，可以导入包（float），`\usepackage{float}`，然后在begin后加h，例如：`\begin{figure}[H]`