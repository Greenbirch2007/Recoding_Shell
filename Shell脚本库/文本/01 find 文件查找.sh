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









