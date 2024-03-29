#!/bin/bash
yum () {
read -p "请输入要安装的服务：" name
yum list | grep "$name"
if [ $ -ne 0]
then
wget -O  /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum repolist
echo "yum源配置成功！"
else
yum install -y $name
yum install -y $name
read -p "系统初始化成功！请输入q键退出程序：" act
case $act in
q|Q)
	exit
;;
*)
	echo "按q退出！！！"
;;
esac
fi
}
while true
do
	yum
done
