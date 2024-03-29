#!/bin/bash
#猜拳游戏
echo "欢迎来到猜数游戏！"
while true
do
	read -p "开始/退出（y/n）:" x
	if [ -z $x ]
	then
		echo "不能为空"
		echo ""
		continue
	elif [ $x = y ]
	then
		echo ""
		echo "游戏即将开始"
		echo ""
	while true
	do
		sleep 1s
		echo "请选择难度"
		echo "1.简单"	
		echo "2.一般"
		echo "3.困难"
		echo "4.地狱"
		echo "5.返回"
		echo ""
		read -p "请输入对应序号：" y
		if [ -z $y ]
		then
			echo "不能为空"
			echo ""
			continue
	elif [ $y = 1 ]
	then
		 while true
		 do
			 num=$[RANDOM%100+1]
			 echo "猜一个1-100的数"
			 n=0
			 while true
			 do
				 read -p "请输入："a
				 let n++
				 if [ -z $a ]
				 then
					 echo "输入不能为空！"
					 continue
				 elif []
			 done
		 done
	done
done
