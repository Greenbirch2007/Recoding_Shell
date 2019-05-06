#!/bin/bash

for x in /var/log/*
do
	#echo "$x is a file living in /var/log"
	echo $(basename $x) is a file living in /var/log
done
