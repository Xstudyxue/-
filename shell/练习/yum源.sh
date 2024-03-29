#!/bin/bash
#判断vsftpd软件包是否安装，如果没有则自动安装
yum list installed | grep vsftpd
if [ $? -eq 0 ];then
	echo "软件已安装，无需安装"
	exit
else
#mount /dev/cdrom /mnt &> /dev/null
#mkdir /etc/yum.repos.d/repo
#mv /etc/yum.repos.d/{*.repo,repo/}

#cat > /etc/yum.repos.d/local.repo <<EOF
#[local]
#name=localyum
#baseurl=file:///mnt/
#enabled=1
#gpgcheck=0
#EOF
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
	yum repolist
	yum -y install vsftpd
	echo "软件已安装！"
fi

yum repolist all

