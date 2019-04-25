#! /bin/bash


# 01 find 文件查找
# 1 查找txt和pdf文件

find . (-name "*.txt" -o -name "*.pdf") -print

# 2 正则方式查找.txt和pdf

find . -regex ".*(.txt|.pdf)$"

# -iregex： 忽略大小写的正则



