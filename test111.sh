#!/bin/bash
echo "-----------游戏规则-----------"
echo "1.玩家出石头，请输入1"
echo "2.玩家出剪刀，请输入2"
echo "3.玩家出布，请输入3"
echo "---------猜拳游戏开始---------"
read -p "请选择(1-3):" act
nu=$((RANDOM%3+1))
if [ $act -ge 1 -a $act -le 3 ]
then
	if [ $act -eq $nu ]
	then
		if [ $act -eq 1 -a $act -eq 1 ]
		then 
		echo "你出的是：石头"
		echo "程序出的：石头"
		echo "平局"
		elif [ $act -eq 2 -a $act -eq 2 ]
		then 
        	echo "你出的是：剪刀"
        	echo "程序出的：剪刀"
        	echo "平局"
		elif [ $act -eq 3 -a $act -eq 3 ]
        	then
        	echo "你出的是：布"
        	echo "程序出的：布"
        	echo "平局"
		fi
	elif [ $act -eq 1 -a $act -ne $nu ]
	then
		if [ $nu -eq 2 ]
		then
		echo "你出的是：石头"
        	echo "程序出的：剪刀"
        	echo "你赢了"
		elif [ $nu -eq 3 ]
		then
        	echo "你出的是：石头"
        	echo "程序出的：布"
        	echo "你输了"
		fi
	elif [ $act -eq 2 -a $act -ne $nu ]
	then
        	if [ $nu -eq 1 ]
        	then
        	echo "你出的是：剪刀"
        	echo "程序出的：石头"
        	echo "你输了"
        	elif [ $nu -eq 3 ]
        	then
        	echo "你出的是：剪刀"
        	echo "程序出的：布"
        	echo "你赢了"
		fi
	elif [ $act -eq 3 -a $act -ne $nu ]
	then
        	if [ $nu -eq 1 ]
        	then
        	echo "你出的是：布"
        	echo "程序出的：石头"
        	echo "你赢了"
        	elif [ $nu -eq 2 ]
        	then
        	echo "你出的是：布"
        	echo "程序出的：剪刀"
        	echo "你输了"
        	fi
	fi
else
echo "请输入1-3!!!!"
fi
