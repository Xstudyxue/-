#!/bin/bash
#使用ssh远程登录主机
#注意要提前做免密
web1=192.168.115.129
web2=192.168.115.130
cat << EOF
目标服务器列表：
1：web1
2：web2
EOF
read -p "请输入编号[1-2]:" nu
case $nu in 
1)
	ssh root@$web1
;;
2)
	ssh root@$web2
;;
q)
	echo "谢谢，再见！"
;;
esac
