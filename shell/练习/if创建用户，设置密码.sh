#!/bin/bash
#read -p "请输入您的密码：" ps
#if [ ${#ps} -lt 7 ]
#then
#	echo "您的密码太短！"
#else
#	echo "您的密码太长！"
#fi

#id $name &> /dev/null
#if [ $? -ne 0 ];then
#	useradd $name
#	read -p  "请输入要设置的密码：" passwd
#	echo "$passwd" | passwd --stdin $name  &>  /dev/null
#	echo "$name 用户创建成功！密码为$passwd"
#else
#	echo "用户$name已存在"
#	grep $name /etc/passwd
#fi
#
read -p "请输入备份的目录：" dir1
if [ -d $dir1 ]
then
	echo "$dir1 "
fi
