#! /bin/bash

#脚本里用sqlplus的-s参数连数据库，spool可将内容输出至文本，用to_char函数格式化查询date数据的输出，
用||'|'||避免逐字段查询一条数据输出成多行，date - interval '15' minute可在数据库查询中对时间进行加减处理。




sqlplus -s $xdbapass <<EOF
set pages 0
set echo off
set feedback off
set line 2000
spool alert.lst
select alert_id||'|'||hostname||'|'||alert_type ||'|'||to_char(check_time,'yyyy-mm
-dd hh24:mi:ss')||'|'||to_char((check_time - interval '15' MINUTE),'yyyy-mm
-dd hh24:mi:ss')||'|'|| sysname||'|'||detail_message from test;
spool off
exit;
EOF