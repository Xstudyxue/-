#!/bin/bash
#判断根分区使用情况
a=`df -Th | grep -w "/"| awk '{print $6}' | tr -d "%"`
af=`df -Th | grep -w "/" | awk '{print$5}'`
aa=`echo "100"`
aaa=$(($aa-$a))
if [ $aaa -le 50 ]
then
	echo "根分区使用正常,剩余空间为"$af
elif [ $aaa -ge 70 ]
then
	echo "根分区空间不多,剩余空间为$af,请及时清理"
elif [ $aaa -ge 85 ]
then
	echo "根分区告急,剩余空间为$af,请及时清理"
else 
	echo "???" 
fi
