#!/bin/bash
ym=`date +%Y`
read -p "请输入您的出生年份：" year
if [ -z $year ]
then
	echo "输入不能为空"
	exit	
else
	if [ $year -ge 1900 -a $year -le 2024 ]
	then
		echo "您的年龄为：" $nl 			
	else
		echo "输入超出范围"
		exit
	fi
fi
