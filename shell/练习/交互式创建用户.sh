#!/bin/bash
while :
do
read -p "请设置用户前缀/数量/密码: " prefix num pass
cat <<-EOF
用户前缀:$prefix
用户数量:$num
用户密码:$pass
EOF
read -p "是否确认创建:[Y/N]" action
if [ $action = y ];then
	break
fi
done
echo "starting create users..."
for i in `seq -w $num`
do
user=$prefix$i
id $user &>/dev/null
if [ $? -eq 0 ];then
echo "$user is already exist"
else
useradd $user
echo $pass | passwd --stdin $user &>/dev/null
fi
done
