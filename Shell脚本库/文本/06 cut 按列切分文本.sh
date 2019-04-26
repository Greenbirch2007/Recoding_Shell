06 cut 按列切分文本
(是列，不是行！)

截取文件的第2列和第4列

cut -f2,4 filname 


去文件除第3列的所有列：

cut -f3 --complement filename

-d指定定界符：

cat -f2 -d";" filename

cut 取的范围

N- 第N个字段到结尾
-M 第1个字段为M
N-M N到M个字段

cut 取的单位

-b 以字节为单位
-c 以字符为单位
-f 以字段为单位(使用定界符)


eg  cut -c1-5 file // 打印第一到5个字符

cut -c-2 file //打印前2个字符


