
04 uniq 消除重复行

消除重复行

sort unsort.txt | uniq

统计各行在文件中出现的次数

sort unsort.txt | uniq -c

找出重复行

sort unsort.txt | uniq -d


可指定每行中需要比较的重复内容：-s开始位置 -w比较字符数