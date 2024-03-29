#!/bin/bash
#设计用户只能输数字

while :
read -p "请输入数字才允许退出系统：" num
do
	if [[ $num =~ ^[0-9]+$ ]]
	then
		echo "谢谢，再见"
		exit
	else
		echo "对不起，请重新输入，"
	fi
done

