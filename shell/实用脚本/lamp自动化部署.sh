#!/bin/bash
#环境
systemctl stop firewalld
systemctl disable firewalld
sed -ri '/^SELINUX=/c SELINUX=disabled' /etc/selinux/config
setenforce 0
getenforce
#安装软件
yum -y install  httpd   mariadb mariadb-server   php   gd   php-gd  php-curl  php-intl    php-mbstring  php-mysql &> /dev/null
if [ $? -ne 0 ]
then 
#配置yum源
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum repolist
else
cd /root
rm -rf /var/www/html/*
unzip kodbox.1.11.zip -d /var/www/html/ &> /dev/null
if [ $? -ne 0 ]
then
	yum -y install unzip
	unzip kodbox.1.11.zip -d /var/www/html/*
fi

chmod -R 777 /var/www/html
systemctl start httpd
systemctl enable httpd
systemctl stop firewalld
setenforce 0
fi
mysql -uroot -e "CREATE DATABASE kdy;"
mysql -uroot -e "SHOW DATABASES;"
systemctl restart httpd

