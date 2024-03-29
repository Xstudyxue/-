#!/bin/bash
#使用case条件判断的系统工具箱
cat <<EOF
f.磁盘管理工具
d.系统挂在工具
m.内存管理工具
u.系统负载工具
q.退出
EOF
read -p "请输入工具序号[h进入帮助]：" action
case "$action" in
f)
	fdisk -l
;;
d)
	df -hT
;;
m)
	free -m
;;
u)
	uptime 
;;
q)
	exit
;;
h)
	echo "关于该工具，最终解释权归管理员所有";;
*)
	echo "error!"
;;
esac

