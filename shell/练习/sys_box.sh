#!/bin/bash
#bash tools.sh
Command() {
echo "Command action"
echo "    h    显示命令帮助"
echo "    f    显示磁盘分区"
echo "    d    显示磁盘挂载"
echo "    m    查看内存使用"
echo "    p    查看系统IP"
echo "    q    退出程序"
}
Command
while 1>0
do
read -p "Command(h for help):" act
case $act in
"h")
	Command
;;
"f")
	lsblk	
;;
"d")
	df -Th
;;
"m")
	free -b
;;
"p")
	ip a
;;
"q")
	exit
;;
*)
	echo "刁毛"
;;
esac 
done
