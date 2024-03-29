#!/bin/bash
#number=`bash /var/ftp/software/homework.sh | wc -l`
#if [ $number -eq 1 ]
#then
#	echo "所有同学都已经提交，很棒！！！" && exit
#fi
echo "没交作业的叼毛有："
for i in `awk '{print $1}' /upload/name.txt`
do
	ls /upload | grep $i &> /dev/null
	if [ $? -ne 0 ]
	then
		echo -n "`grep $i /upload/name.txt | awk '{print $1}'` "
	fi
done
echo

