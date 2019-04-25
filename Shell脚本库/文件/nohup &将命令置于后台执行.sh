#! /bin/bash


#nohup &将命令置于后台执行，find命令后紧跟查询路径，-name匹配路径下文件，
# -newermt查找晚于给定时间的文件，-not -newermt查找早于给定时间的文件，-exec 对找出的文件名进行逐个处理，注意{} ;。


nohup find /$sysname/dump/$yesterday/ -name 'dump_GetClusterStacks*' -newermt "$before_check_time" 
 -not -newermt "$check_time" -exec /usr/local/bin/python /$sysname/dump/dump_analayze.py -f {} \; &