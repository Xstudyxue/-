#!/bin/bash
#read -p "请输入您的第一门成绩：" number1
#read -p "请输入您的第二门成绩：" number2
#echo -n "总成绩是："
#expr $number1 + $number2
#number=`echo $number1 + $number2 | bc`
#echo "总成绩：$number"

#echo -n "平均成绩是："
#echo "($1+$2)/2" | bc

# 求 $1 $2 的和
#x=${1:-0}
#y=${2:-0}
#echo $(($x+$y))

#计算我的信用卡一年的利息，假设我欠10000块钱
#m=$( echo 5/10000|bc -l) 
#sum=10000
#for i in {1..365}
#do
#	sum=$(echo $sum+$sum*$m | bc )
#	echo $sum
#done
#echo $sum

sum=1.5
for i in {1..20}
do
	sum=$(echo $sum+1|bc)
	echo $sum
done
