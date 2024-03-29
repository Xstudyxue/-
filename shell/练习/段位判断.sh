#!/bin/bash
#根据输入的分数判断段位
echo "欢迎使用查分系统脚本有五个档位"
echo "！青铜 ! 白银 ! 黄金 ! 钻石 ! 王者 ! "
read -p "输入你的得分" num
#if [ $num -ge 0 ] && [ $num -le 30 ];then
#	echo "青铜 "
#elif [ $num -ge 31 -a $num -le 60 ];then
#	echo "白银"
#elif [ $num -ge 61 -a $num -le 80 ];then
#	echo "黄金"
#elif [ $num -ge 81 -a $num -le 90 ];then
#	echo "钻石"
#elif [ $num -ge 91 -a $num -le 100 ];then
#	echo '王者'
#else
#	echo '成绩无效必须在0-100范围'
#fi
