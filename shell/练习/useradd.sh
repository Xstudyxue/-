#!/bin/bash
read -p "请输入你要创建的用户名：" name
id $name &> /dev/null
if [ $? -eq 0 ]
then
	read -p "用户已存在，是否删除(yes/no):" del
	case $del in
	yes|Yes|YEs|YES|Y|y)
	userdel -r $name
	echo "用户$name已删除"
	;;
	NO|No|no|n)
	echo "未确认的操作"
	exit
	;;
	*)
	echo "请输入yes/no"
	;;
	esac
else
	read -sp "请输入新用户名的密码：" pass
	useradd $name
	echo "$pass" | passwd --stdin "$name"
	echo "用户$name已创建"
fi
