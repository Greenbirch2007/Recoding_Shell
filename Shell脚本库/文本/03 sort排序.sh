
03 sort排序

字段说明：
-n:按数字进行排序 VS -d 按字典排序
-r 逆序排序
-k N 指定按第N列排序

eg:

sort -nrk 1 data1.txt
sort -bd data // 忽略像空格之类的前导空白字符