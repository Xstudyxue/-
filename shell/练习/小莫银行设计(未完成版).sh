#!/bin/bash

display_menu(){
cat << EOF
--------------------
        1、注册
        2、登录
        3、退出
--------------------
EOF
}
display_menu
menu_main(){
cat << EOF
------------------
        1、查询
        2、充值
        3、消费
-------------------
EOF
}

menu(){
cat << EOF
------------------
        1、返回主菜单
        2、退出
-------------------
EOF
# 要加菜单，不然就无意义
while true
do
read -p "请输入业务数字：" o
case $o in
1)
        menu_main
        break
;;
2)
        exit
;;
esac
done
}


# 主循环，处理用户输入
while true;do
        read -p "请选择操作: " CHOICE  
        USER_TXT=./user.txt
        case $CHOICE in
        1)
        read -p "请输入要注册的用户名:" USER_LIST
        RMB=100  #成功注册的用户起始金额为100
        for USER in $USER_LIST
        do
        if ! id $USER;then
                useradd $USER &>/dev/null
                if [ $? -eq 0 ];then
                        echo "用户$USER_LIST已成功添加"
                        read  -p "请输入密码:" PASS
                        echo
                        read  -p "请确认密码:" SURE_PASS
                        echo
                        if [ -z $PASS ];then
                                echo "密码不能为空"
                                echo "用户$USER创建失败`userdel -r $USER`"
                                display_menu
                        elif [ $PASS -ne $SURE_PASS ];then
                                echo "两次输入的密码不一样，请重新输入"
                                echo "用户$USER创建失败`userdel -r $USER`"
                                display_menu
                                break
                        else
                                echo "$USER:$PASS:$RMB ">> $USER_TXT
                                echo "注册成功，请等待回转界面"
                                sleep 1
                                display_menu
                                break
                        fi
                else
                        echo "用户$USER_LIST添加失败"
                fi
        else
                echo "该用户已存在,请重新输入"
        fi
        done
        ;;
        2)
        sum=0
        read -p "请输入用户名:" USER_NAME
        while [ $sum -lt 3 ]
        do
        grep -q "^$USER_NAME:" "$USER_TXT"
        if ! [ $? -eq 0 ];then
                echo "用户不存在"
                break
        else
                read -s -p "请输入用户密码:" USER_PASS
                echo
                SAVE_PASS=$(grep  "^$USER_NAME:" "$USER_TXT"|awk -F ":" '{print $2}')
                if [ -z $USER_PASS ];then
                        echo "密码不能为空"
                elif ! [ $USER_PASS = $SAVE_PASS ];then
                        echo "密码错误"
                        
                else
                        echo "登录成功"
                        menu_main
                while true;do
                read -p "请选择操作: " CHOICE1
                 case $CHOICE1 in
                1)
                #read -p "选择要查询的用户：" USERNAME
                BALANCE=$(grep "^$USER_NAME:" "$USER_TXT" | awk -F ':' '{print $3}')
                echo "当前用户的余额为: $BALANCE"
                menu
                ;;
                2)

                while true;do
                #read -p "选择要充值的用户：" USERNAME
                read -p "请输入充值的金额（须为100的整数）:" credit_money
                BALANCE=$(grep "^$USER_NAME:" "$USER_TXT" | awk -F ':' '{print $3}')
                if ! (( $credit_money % 100 ==0));then
                        echo "充值金额必须为100的整数"
                else
                        new_balance=$[ credit_money + BALANCE ]
                        sed -i "s/$BALANCE/$new_balance/" "$USER_TXT"
                        echo "充值成功，当前金额为: $new_balance"
                        menu
                        break
                fi
                done
                ;;
                3)

                while true;do
                #read -p "选择要消费的用户：" USERNAME
                read -p "请输入消费的金额:" consume_money
                BALANCE=$(grep "^$USER_NAME:" "$USER_TXT" | awk -F ':' '{print $3}')
                if [ $consume_money -gt $BALANCE ];then
                        echo "余额不足，请充值"
                elif [ $consume_money -le $BALANCE ];then
                        new_spend_money=$[ $BALANCE - $consume_money ]
                        sed -i "s/$BALANCE/$(($BALANCE - $consume_money))/" "$USER_TXT"
                        echo "消费成功，当前余额为: $new_spend_money"
                        menu
                        break
                fi
                done
        ;;
        esac
        done
                fi
        let sum++
        
        fi
        done
                if [ $sum -eq 3 ];then
                        echo "登录超过三次，滚吧"
                        exit
                fi
                ;;
                3)
                exit
                ;;
                *)  
                        echo "无效选项，请重新输入"  
                ;;
        esac
done

