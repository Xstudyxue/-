#!/bin/bash
#开始界面
index () {
echo "------------------"
echo "1.注册"
echo "2.登入"
echo "3.退出"
echo "------------------"
read -p "输入数字进入相应的菜单：" nu
}
#注册
register () {
while true
do
	touch /root/test/user.txt &> /dev/null
	if [ $? -eq 0 ]
	then
	read -p "请输入要创建的名字：" name
	uname=`cat /root/test/user.txt | cut -d":" -f1 | grep -w "$name"`	
if [ -z $name ]
then
	echo "用户名不能为空"
	continue
else
	if [ "$uname" == "$name" ]
	then
		echo "用户已存在，请重新输入"
		continue
	else
		break
	fi
	fi
fi
done
while true
do
	read -sp "请输入你要设置的密码：" pass
	if [ -z $pass ]
	then
	echo
	echo "密码不能为空请重新输入!"
	continue
	else
	break
	fi
done
while true
do
	echo
	read -sp "请确认你的密码：" rpass
	if [ "$rpass" == "$pass" ]
	then		
		sleep 1
		break
	else
		echo
		echo  -n "两次输入不一样，请重新输入"
		continue
	fi
done	
}
#登录
login () {
while true
do
read -p "请输入用户名：" user
luser=`cat /root/test/user.txt | cut -d":" -f1 | grep -w "$user" 2> /dev/null`
if [ -z $user ]
then
	echo "用户名不能为空"
else
if [ "$luser" != "$user" ]
then
	echo "用户名不存在，请重新输入"
	continue
else
for ((i=1;i<=3;i++))
do
	read -sp "请输入密码：" lpass
	echo
	lcpass=`cat /root/test/user.txt | grep -w "$user" | cut -d ":" -f2`
	if [ -z "$lpass" ] || [ $lpass -ne $lcpass ] || [ "$lcpass" != "$lpass" ]
	then
		echo "用户密码不匹配，请重新输入"
		if [ $i -lt 3 ]
		then
			continue
		else
			echo "输入次数过多，已退出"
			exit
		fi
	else
		sleep 1
		break
	fi
	done
	break
fi
fi
done
}
#用户主菜单
U_menu () {
while true
do
cat <<-EOF
q:返回主菜单
e:退出
EOF
read -p "请选择退出还是继续返回主菜单:(q/e)"  menu
case $menu in
q|Q|quit)
echo "正在返回主菜单"
sleep 1
break
;;
e|E|exit)
echo "正在退出"
sleep 1
exit
;;
esac
done
}
#调用
while true
do
	index
	if [ "$nu" == "1" ]
	then
	register
		sum=100
		echo "$name:$pass:$sum" >> /root/test/user.txt
	echo
	echo  "注册成功"
	sleep 1
	continue
	elif [ "$nu" -eq "2" ]
	then
	login
	echo
	echo "登录成功"
	sleep 1
	while true
	do
	cat <<-EOF
	1 查询
	2 充值
	3 消费
	EOF
	read -p "1-3:" lo
	mo=`cat /root/test/user.txt | grep -w "$luser" | cut -d":" -f3`
	case $lo in
	"1")
		echo "你的账号余额为$mo"
		U_menu
	;;
	"2")
	while true
	do
                read -p "请输入要充值的金额：" cmo
                if (( $cmo % 100 != 0 ))
                then
                        echo "充值失败"
                        U_menu
			break
                else
			moa=$[cmo+mo]
                        echo "充值成功，你的账户余额为$moa"
                 	sed -ir "/\<$luser\>/ s/$mo/$moa/" /root/test/user.txt
                        U_menu
			break
                fi
        done
	;;
	"3")
	while true
	do
		read -p "请输入你要消费的金额：" lmo
		if [ $mo -ge $lmo ]
		then
			mob=$[mo-lmo]
			echo "你一共消费$lmo，剩余余额为$mob"
			sed -ir "/\<$luser\>/ s/$mo/$mob/" /root/test/user.txt
			U_menu
			break
		else
			echo "余额不足，请充值"
			U_menu
			break
		fi
	done	
	;;	
	esac
	done
	elif [ "$nu" == "3" ]
	then
	echo "正在退出"
	sleep 1
	break
	else
	echo "???，故意找茬是不是"
	fi
done
