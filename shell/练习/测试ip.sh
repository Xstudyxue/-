#!/bin/bash
read -p "请输入要测试的IP地址：" ip
if [ $ip != "" ];then
	ipt=`ping $ip`
	if [ $? -eq 0 ];then
		echo "alive"
	else
		echo "no alive"
	fi
	break
else
	echo "不能为空，请重新输入"
fi
