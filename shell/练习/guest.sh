#!/bin/bash
echo "欢迎进入猜数字游戏"
Price=$(expr $RANDOM % 1000)
Times=0
echo "物品实际价格为0-999之间，猜猜看是多少？"
reg_limit='^[0-9]+$'
reg_limit2='^[a-zA-Z]+$'
while true
do
	if [ $Times -ge 10 ]
	then
	echo "您未能在10次内猜中，抱歉"
	echo "实际价格为$Price"
	exit 0
	else
	read -p "请输入您猜测的价格：(输入 字母Q或者q可中途退出程序.)" GPRICES
	let Times++
		if [[ $GPRICES =~ $reg_limit2 ]] # 正则匹配多个输入的字符
		then
			#echo "$GRADE 是纯字母"
			if [ $GPRICES = "Q" ]||[ $GPRICES = "q" ]
			then
			echo "再见"
			exit 0
			else
			echo "输入信息有误，请您重新输入"
			fi
		elif [[ $GPRICES =~ $reg_limit ]] # 匹配多个数字
		then
			#echo "$GRADE是纯数字"
			if [ $GPRICES -eq $Price ]
			then
			echo "恭喜您答对了，实际价格是$Price"
			echo "您总共猜测了$Times次"
			exit 0
			elif [ $GPRICES -gt $Price ]
			then
			echo "高了"
			else
			echo "低了"
			fi
		else
			echo "输入信息有误，请您重新输入"
		fi
	fi
done
