10 awk 数据流处理工具

awk

awk 'BEGIN{statements} statements END{statements}'


工作方式：
1.执行beign中语句块；
2.从文件或stdin中读入一行，然后执行statements2,重复这个过程，知道文件全部被读取完毕；
３．执行end语句块；

print 打印当前行

使用不带参数的print时，会打印当前行;

echo  -e "line1 line2" | awk  'BEGIN{print "start"}{print }END{ print "END"}'

ｐrint以逗号分割时，参数以空格定界；

echo | awk ' {var1 = "v1" ; var2 = "v2";var3="v3";
print var1,var2,var3;
}'

使用~~拼接符的方式(“作为拼接符”)；

echo | awk ' {var1 = "v1" ; var2 = "v2";var3="v3";
print var1"~~"var2"~~"var3;
}'

特殊变量：NR  NF $0 $1 $2

NR:表示记录数量，在执行过程中对应当前行号；
NF:表示字段数量，在执行过程总对应当前行的字段数；
$0:这个变量包含执行过程中当前行的文本内容；
$1:第一个字段的文本内容；
$2:第二个字段的文本内容；

echo -e "line1 f2 f3 line2 line 3" | awk '{print NR":"$0"-"$1"-"$2}'


打印每一行的第二和第三个字段

awk '{print $2,$3}' file

统计文件的行数

awk 'END {print NR}' file

累加每一行的第一个字段：

# 下面这个脚本有问题
echo -e "1 2 3 4 " | awk 'BEGIN{num = 0 ;
print "begin";} {sum += $1;} END {print "=="; print sum }' 

＃　下面这个脚本可以正常输出，对比一下
echo -e "1 2 3 4 " | awk 'BEGIN{num = 0 ;
print "begin";} {sum += $1;} END {print "=="; print sum }'


传递外部变量

var=1000
echo | awk '{print vara}' vara=$var # 输入来自stdin
awk '{print vara}' vara=#var file # 输入来自文件

用样式对awk处理的行进行过滤

awk 'NR < 5' #行号小于５
比如，cat file | awk 'NR < 5'

awk 'NR==1,NR==4 {print}' file #行号等于１和４的打印出来

awk '/linux/' #包含linux文本的行(可以用正则表达式来指定，很常用)
awk '!/linux/' # 不包含linux文本的行


设置定界符

使用-F来设定定界符(默认为空格)

awk -F: '{print $NF}' /etc/passwd


读取命令输出

使用getline,将外部shell命令的输出读入到变量cmdout中

echo | awk '{"grep root /etc/passwd" | getline cmdout;print cmdout } '


在awk中使用循环

for(i=0;i<10;i++){print $1;}
for(i in array){print array[1];}


eg:

以逆序的形式打印行：（tac命令的实现)

seq 9|
awk '{lifo[NR] = $0; lno=NR}
END{ for(;lno>-1;lno--){print lifo[lno];}
} '


awk实现head，tail命令

head:
awk 'NR<=10{print} file


tail:
  awk '{buffer[NR%10] = $0;} END{for(i=0;i<11;i++){
  print buffer[i %10]} } ' filename

打印指定列

awk方式实现

ls -lrt | awk '{print $6}'

cut方式实现

ls -lrt | cut -f6

打印指定文本区间

确定行号

seq 100| awk 'NR==4,NR==6{print}'

确定文本

打印处于startpattern和endpattern之间的文本

awk '/start_pattern/, /end_pattern/' filename


eg:

seq 100 | awk '/13/, /15/'
cat /etc/passwd| awk '/mai.*mail/,/news.*news/'


awk常用内建函数

index,sub,match,length

echo | awk '{"grep root /etc/passwd" | getline cmdout; print length(cmdout) }'

printf类似c语言中的printf，对输出进行格式化

eg:

seq 10 | awk '{print "->%4s ",$1}'


迭代文件中的行，单词和字符

１．迭代文件中的每一行

while循环法

while read line;
do
echo $line;
done < file

改成子shell：

cat file | (while read line;do echo $line;done)

awk法：

cat file | awk '{print}'

２．迭代一行中的每一个单词

for word in $line;
do
echo $word';
done 

3.迭代每一个字符

${string:startpos:numof_chars}:从字符串中提取一个字符；(bash文本切片)
${#word}:返回变量word的长度

for((i=0;i<${#word};i++))
do
echo $(word:i:1);
done
