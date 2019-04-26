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
