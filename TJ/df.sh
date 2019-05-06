#!/bin/bash
#判断iptables是否在运行，如果已经在运行提示信息，如果没有开启它。
service iptables status &> /dev/null
if [ $? -eq 0 ];
  then
    echo "iptables service is running"
  else
    service iptables restart
fi
