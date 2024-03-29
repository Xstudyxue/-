#!bin/bash
while 1>0
do
	read -p "请输入end结束此进程" end
	if [ $end = "end" ];then
		break
	else
		continue
	fi
done
