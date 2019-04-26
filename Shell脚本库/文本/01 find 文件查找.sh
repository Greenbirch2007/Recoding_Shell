#! /bin/bash


# 01 find 文件查找
# 1 查找txt和pdf文件

find . (-name "*.txt" -o -name "*.pdf") -print

# 2 正则方式查找.txt和pdf

find . -regex ".*(.txt|.pdf)$"

# -iregex： 忽略大小写的正则



3.否定参数 

 查找所有非txt文本

 find . ! - name "*.txt" -print


4.指定搜索深度  

按类型搜索：

find . -type d -print  // 只列出所有目录
-type f 文件  / l 符号链接


按时间搜索：

-atime 访问时间(单位是天，分钟单位是-amin,以下类似)
-mtime 修改时间  (内容被修改)
-ctime 变化时间 (元数据或权限变化)


最近7天被访问过的所有文件：

find . -atime 7 -type f -print

按大小搜索

w字 k M G
（字节大小是k小写，兆，级，则是大写）
# 这是找出大于200兆的文件
find . -type f -size +200M  

# 找出大于200M的文件 复制到另一个目录中
find . -type f -size +200M  -exec cp {} /home/g/Documents \;
按权限查找

find . -type f -user weber -print // 找到weber所拥有的文件

6. 找到后的后续动作

删除：

删除当前目录下所有的py文件：

find . -type f -name "*.py" -delete

执行动作(强大的exec)

find -exec 这个命令组合很好用，在find命令后加上 -exec，就可以把找出来的东西进行操作。



find . -type f -user root -exec chown weber {} ; //将当前目录下的所有权变革为weber


注意：{}是一个特殊的字符串，对于每一匹配的文件，{}会被替换成相应的文件名；
例如：将找到的文件全都copy到另一个目录：
# find: 遗漏“-exec”的参数 的问题
find . -type f -mtime +10 -name "*.py" -exec cp {}OLD;

# 下面是正确的脚本
find . -type f -mtime +10 -name "*.py" -exec cp {} /home/g/Documents \;


# 把刚才复制的文件给删除
find . -type f -name "*.py" -exec rm -f {} \;


 i
7. 结合多个命令

tips:如果需要后续执行多个命令，可以将多个命令写成一个脚本，然后
-exec 调用时执行脚本即可

-exec ./commands.sh {} ;


-print的定界符

默认使用''作为文件的定界符；
-print0使用''作为文件的定界符，这样就可以搜索包含空格的文件；

02 grep文本搜索

grep match_patten file //默认访问匹配行

常用参数

-o 只输出匹配的文本行  VS -v 只输出没有匹配的文本行

-c 统计文件中包含文本的次数


grep -c "text" filename

-n打印匹配的行号
-i搜索时忽略大小写
-l只打印文件名

l在多级目录中对文本递归搜索（程序员搜代码时经常使用）：

grep "class" . -R -n

2.匹配多个模式

grep -e "class"  -e "vitural" file

3. grep输出以作为结尾符的文件名：(-z)

grep "text" file*.lz| xargs -o rm

4.xargs 命令行参数转换

xargs能够将输入数据转化为特定命令的命令行参数；这样，可以配合
很多命令来组合使用。比如grep,比如find

将多行输出转化为单行输出

cat file.txt| xargs

是多行文本间的定界符

将单行转化为多行输出

cat single.txt | xargs -n 3

-n: 指定每行显示的字段数


xargs 参数说明

-d 定义定界符(默认为空格 多行的定界符)
-n 指定输出为多行
-l {} 指定替换字符串，这个字符串在xargs扩展时会被替换掉，
用于待执行的命令需要多个参数时

例如：

cat file.txt | xargs -I {} ./command.sh -p {} -1

-0 ：指定为输入定界符

例如：统计程序行数

find source_dir/ -type f -name "*.cpp" -print0 |xargs -0 wc -l

03 sort排序

字段说明：
-n:按数字进行排序 VS -d 按字典排序
-r 逆序排序
-k N 指定按第N列排序

eg:

sort -nrk 1 data1.txt
sort -bd data // 忽略像空格之类的前导空白字符


04 uniq 消除重复行

消除重复行

sort unsort.txt | uniq

统计各行在文件中出现的次数

sort unsort.txt | uniq -c

找出重复行

sort unsort.txt | uniq -d


可指定每行中需要比较的重复内容：-s开始位置 -w比较字符数


05用 tr进行转换

通用用法

echo 12345 | tr '0-9' '9876543210' // 加解密转换，替换对应字符
cat text| tr '   '   ' '' //制表符转空格


tr删除字符

cat file | tr -d '0-9' 