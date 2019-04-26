05用 tr进行转换

通用用法

echo 12345 | tr '0-9' '9876543210' // 加解密转换，替换对应字符
cat text| tr '   '   ' '' //制表符转空格


tr删除字符

cat file | tr -d '0-9'  // 删除所有数字

-c 求补集

cat file | tr -c '0-9'  //获取文件中所有数字

cat file | tr -d -c '0-9' //删除非数字数据

1、将文件file中出现的"abc"替换为"xyz"

cat file | tr "abc" "xyz"

2、使用tr命令“统一”字母大小写

cat file | tr [a-z] [A-Z]

3、把文件中的数字0-9替换为a-j

cat file|tr [0-9] [a-j]

4、删除文件file中出现的"Snail"字符

cat file|tr -d "Snail"

5.删除文件file中出现的换行'\n',制表'\t'字符

cat file | tr -d "\n\t"

7.删除空行

cat file | tr -s "\n" > new_file

8.删除Windows文件“造成”的"^M"字符

cat file | tr -d "\r"
或
cat file | tr -s "\r" "\n"

9. 用空格\040替换制表符\011

cat file | tr -s "\011" "\040"


10.把路径变量中的冒号":",替换成换行符"\n"

echo $PATH | tr -s ":" “\n”

实际应用1，加密解密：

echo 12345|tr '0-9' '987654321'  # 加密
echo 87654|tr '987654321' '0-9' ##解密

echo 1asdaer|tr '0-6' '67464'

实际应用2，字符集补集：

tr -c [set1] [set2]

set1的补集意味着从这个集合中包含set1中没有的所有字符。
最典型的用法就是从输入文本中将不在不集中的
所有字符全部删除

echo "hello 123 world" | tr -d c '0-9 \n'

实际应用3，用tr压缩字符:

echo "GNU is  not          UNIX . Recursicve right?" | tr -s  ' '


tr压缩字符

tr -s 压缩文本中出现的重复字符；最常用于压缩多余的空格

cat file | tr -s ' '

字符类

tr中可用各种字符类：

alnum:字母和数字
alpha:字母
digit:数字
space:空白字符
lower:小写
upper:大写
cntrl:控制(非可打印)字符


print ： 可打印字符

使用方法：tr[:class:][:class:]
eg:  tr '[:lower:]' '[:upper:]'


