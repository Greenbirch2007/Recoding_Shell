#! /bin/bash

#文本内容作为url一部分时，用sed将空格替换成%20
sendmsg=`echo ${alert_message%[*}|sed 's/\ /\%20/g'`
phonelists=`echo $phonelist|sed 's/\ /\%20/g'`