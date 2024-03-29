#!/bin/bash
#使用位置变量批量创建文件
for i in `cat name.txt`
do
	name=`echo $i | awk -F":" '{print $1}'`
	sex=`echo $i | awk -F":" '{print $2}'`
	zooe=`echo $i | awk -F":" '{print $3}'`
	printf "%-15s %-8s %s\n" $name $sex $zooe
done > name.txt.bak
