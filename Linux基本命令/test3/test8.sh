#!/bin/bash
cat > /data/uname.txt<<eof
zhangwuji
zhangsanfeng
zhangcuishan
kongwen
kongxiang
kongjian
libai
dufu
wangwei
eof
cat > /data/gname.txt<<eof
wudang
shaolin
emei
eof
group_add () {
for group_name in `cat /data/gname.txt`;
do
mkdir /data/$group_name &> /dev/null
groupadd $group_name &> /dev/null
done
}

user_add () {
for user_name in `cat /data/uname.txt`
do
	echo $user_name
	case $user_name in
	"zhangwuji"|"zhangsanfeng"|"zhangcuishan")
	useradd -g wudang -d /data/wudang/$user_name $user_name
	echo "$user_name" | passwd --stdin "$user_name" &> /dev/null
	echo $(date +%Y-%m-%d-%H-%M-%S) $user_name "useradd ok" > /data/userinfo
	;;
	"kongwen"|"kongxiang"|"kongjian")
	useradd -g shaolin -d /data/shaolin/$user_name $user_name
	echo "$user_name" | passwd --stdin "$user_name" &> /dev/null
	echo $(date +%Y-%m-%d-%H-%M-%S) $user_name "useradd ok" > /data/userinfo
	;;
	"libai"|"dufu"|"wangwei")
	useradd -g emei -d /data/emei/$user_name $user_name
	echo "$user_name" | passwd --stdin "$user_name" &> /dev/null
	echo $(date +%Y-%m-%d-%H-%M-%S) $user_name "useradd ok" > /data/userinfo
	;;
	esac
done
}
group_add
user_add &> /dev/null
