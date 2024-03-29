#!/bin/bash
read -p "请输入想创建的用户名：" user
if [ $USER = "root" ];then
	id $user &> /dev/null
	if [ $? -eq 0 ]
	then
        echo "${user}已存在"
	else
        useradd $user && echo "用户已创建"
	fi	
else
	echo "你不是root用户，无权限"
fi
