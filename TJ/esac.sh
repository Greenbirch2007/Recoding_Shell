#!/bin/bash
case $1 in 
start)
	echo "start mysql"
;;
stop)
	echo "stop mysql"
;;
*)
	echo "usage:$0 start|stop"
;;
esac
