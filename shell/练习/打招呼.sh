#!/bin/bash
#根据当前系统时间，向用户打招呼
#current_time=$(date +"%Y-%m-%d %H:%M:%S")
#echo "当前系统时间为：$current_time"
hour=`date +%H`
if [ $hour -ge 6 -a $hour -le 10 ];
then
	echo "用户，早上好！"
elif [ $hour -ge 11 -a $hour -le 13 ];
then
	echo "用户，中午好！"
elif [ $hour -ge 14 -a $hour -le 18 ];
then
	echo "用户。下午好！"
else
	echo "用户，晚上好！"
fi
