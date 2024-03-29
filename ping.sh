#!/bin/bash
#ip=192.168.122.1
#read -p "请输入要测试的ip地址：" $1
#ping -c1 $ip &> /dev/null && echo $ip upupup" || echo "$ip downdowndown"

#>ip.txt
#>downip.txt
#
#for i in {127..254}
#do 
#	{
#	ip=192.168.115.$i
#	ping -w 3 -i 0.3 $ip  > /dev/null
#	if [ $? -eq 0 ];then
#		echo "$ip" | tee -a ip.txt
#	else
#		echo "$ip" >> downip.txt
#	fi
#} &
#done
#wait
#echo "在线主机测试完毕！"

ping -c1 $1 &> /dev/null
if [ $? -eq 0 ]
then
	echo $1"可以ping通"
else
	echo $1"不可以ping通"
fi
