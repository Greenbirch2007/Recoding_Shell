07 paste 按列拼接文本


将两个文本按列拼接在一起


cat file1 

1
2


cat file2

colin
book


paste file1 file2 

默认的定界符是制表符，可以用-d指明定界符

paste file1 file2 -d "~~"