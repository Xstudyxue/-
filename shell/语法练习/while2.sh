#!/bin/bash
while read line
do
	hosts[++i]=$line
done < /etc/hosts
echo 输出数组的值 
echo ${hosts[*]}
echo 输出数组的索引
echo ${!hosts[*]}

for i in ${!hosts[@]}
do
	echo "$i : ${hosts[$i]}"
done
