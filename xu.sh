#!/bin/bash
[ -f /root/yxuser.txt ] &>/dev/null || touch /root/yxuser.txt
pp(){
while true
do
read -p "返回主菜单(q),退出系统(e):" p
if [ "$p" = "q" ];then
        break
elif [ "$p" = "e" ];then
        exit
else
        echo "选项无效，请重新输入！"
fi
done
}
while true
do
cat<<EOF
-------------
1.注册
2.登入
3.退出
-------------
输入数字进入相应的菜单
EOF
read -p "请输入数字1～3：" i
case $i in
1)
while true
do
read -p "请输入昵称：" j
a=`cat /root/yxuser.txt | grep -w "$j" | awk -F":" '{print $1}'`
if [ -z `echo "$j" | sed 's/[0-9]//g'` ];then
        if [ "$j" = "$a" ];then
                echo "该用户已存在，请重新输入"
                continue
        else
        useradd $j &> /dev/null
                while true
                do
                read -s -p "设置新密码:" m
                        if [ -z $m ];then
                                echo
                                echo "密码不能为空，请重新输入"
                                continue
                        else
                        echo
                        read -s -p "确认新密码:" n
                                if [ "$m" = "$n" ];then
                                        sudo echo "$m" | passwd --stdin $j | &> /dev/null
                                        echo
                                        echo "用户创建成功"
                                        echo "$j:$m:100" >> yxuser.txt
                                        break
                                else
                                        echo "两次密码输入不一致，请重新输入"
                                        continue
                                fi
                        fi
                done
        fi
        break
else
        echo "昵称不能为空或纯数字"
fi
done
;;
2)
read -p "请输入用户名：" j
b=`cat /root/yxuser.txt |  grep -w "$j" | awk -F":" '{print $1}'`
if [ -n "$b" ];then
        for i in {1..3}
        do
        read -s -p "请输入密码：" m
        c=`cat /root/yxuser.txt | grep -w "$j" | awk -F":" '{print $2}'`
                if [ "$m" = "$c" ];then
                        echo "登入成功！"
                        break
                elif [ $i -eq 3 ];then
                        echo
                        echo "密码错误！登入失败,将退出系统！"
                        sleep 3s
                        exit
                else
                        echo
                        echo "密码错误！还有$[3-$i]次机会"
                        continue
                fi
        done
else
        echo "该用户不存在！"
        continue
fi
cd(){
cat<<EOF
---------------------
1.查询
2.充值
3.消费
4.退出到登陆页面
5.退出系统
---------------------
EOF
}
while true
do
cd
d=`cat /root/yxuser.txt | grep -w "$j" | awk -F":" '{print $3}'`
read -p "请输入选项：" k
        case $k in
        1)
        echo ""$j"剩余金额："$d""
        ;;
        2)
        read -p "请输入充值金额(必须是100的倍数)：" qian
        if [ -z "$qian" ];then
        un=`cat -n /root/yxuser.txt | grep -w "$j" | awk '{print $1}'`
                if [ -z `echo "$qian" |sed 's/[0-9]//g'` ];then
                        jin=$[qian%100]
                        if [ "$jin" -eq "0" ];then
                                sed -i ''$un' s/'$d'/'$[d+qian]'/' /root/yxuser.txt
                                echo "充值成功！"
                                pp
                        else
                                echo "充值失败，输入内容不符合条件！"
                                pp
                        fi
                else
                        echo "充值失败，输入内容不是纯数字！"
                        pp
                fi
        else
                echo "充值金额不能为空，充值失败！"
        fi
        ;;
        3)
        echo "欢迎来到商场！"
        read -p "请输入你想消费的金额：" mai
        if [ -z "$mai" ];then
                if [ -z `echo $mai | sed 's/[0-9]//g'` ];then
                        if [ $mai -le $d ];then
                                sed -i ''$un' s/'$d'/'$[d-mai]'/' /root/yxuser.txt
                                echo "消费成功！"
                                pp
                        else
                                echo "余额不足！"
                                pp
                        fi
                else
                        echo "输入金额不符合条件！消费失败"
                        pp
                fi
        else
                echo "输入为空，消费失败！"
        fi
        ;;
        4)
        break
        ;;
        5)
        echo "退出系统成功！"
        exit
        ;;
        *)
        echo "无效选项，请重新输入！"
        ;;
        esac
done
;;
3)
echo "退出系统成功！"
exit
;;

