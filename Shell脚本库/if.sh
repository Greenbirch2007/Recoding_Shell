#! /bin/bash

# if语句结构，-f判断文件是否存在，注意[]里左右两侧的空格。
if [ ! -f $passfile ];then
echo 'passfile is not exist!'
exit
fi