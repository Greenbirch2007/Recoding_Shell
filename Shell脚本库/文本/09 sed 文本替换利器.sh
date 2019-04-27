09 sed 文本替换利器

首行替换

sed 's/text/replace_txt/' file //  替换每一行的第一处匹配的text

sed 's/1/$$$/' file

全局替换

sed 's/text/replace_txt/g' file

默认替换后，输出替换后的内容，如果需要直接替换原文件，使用 -i

sed -i 's/text/replace_txt/g' file

移除空白行：
sed '/^$/d' file

变量转换

已匹配的字符串通过标记&来引用

echo this is an example | sed 's/w+/[&]/g'

子串匹配标记

第一个匹配的括号内容使用标记来引用

sed 's/hello([0-9])//'

双引号求值

sed通常用单引号来引用；也可以使用双引号，使用双引号后，双引号会对表达式求值：

sed 's/$var/HELLO/'

当使用双引号时，我们可以在sed样式和替换字符串中指定变量；

eg:

p=patten
r=replaced
echo "line con a patten" | sed 's/$p/$r/g'

其他示例

字符串插入字符：将文本中每行内容(PEKSHA)转换为PEK/SHA

sed 's/^.{3}/&//g' file


