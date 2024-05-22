#!/bin/bash
#判断http服务是否启动
Active=`systemctl status httpd | awk  'NR==3{print $2}'`

systemctl status httpd &> /dev/null
if [ $Active = "active" ]
then
	echo "http服务正在运行"
	systemctl start httpd
	read -p "确认是否停止：(y/n)" action
	case $action in
Y|y|yes|Yes|YEs|YES)
	systemctl stop httpd
	echo "已为你停止httpd服务"
;;
N|n|NO|No|no)
	exit
;;
esac
else
	echo "http服务未运行"
	read -p "确认是否启动：(y/n)" action1
        case $action1 in
Y|y|yes|Yes|YEs|YES)
        systemctl start httpd
        echo "已为你启动httpd服务"
;;
N|n|NO|No|no)
        exit
;;
esac
fi
