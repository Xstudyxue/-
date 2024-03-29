#!/bin/bash
#猜数字大小
min=1
max=100
random_nu=$(( min + RANDOM % max ))
for ((i=1;i<=6;i++))
do
	echo $random_nu
	read -p "请输入你要猜的数：" nu
  if [[ $nu =~ ^[0-9]+$ ]]
  then
	if [ $nu -ge 1 -a $nu -le 100 ]
	then
		if [ $nu -lt $random_nu ]
		then
			echo "数字小了"
			echo "你还有$[6-i]次机会"
		elif [ $nu -eq $random_nu ]
		then
			echo "恭喜你答对了！"
			exit
		else
			echo "数字大了"
			echo "你还有$[6-i]次机会"
		fi
        else
        echo "输入超出范围，请重新输入"
        echo "你还有$[6-i]次机会"		
	fi
  else
	echo "输入的不是纯数字，请重新输入"
	echo "你还有$[6-i]次机会"
  fi
done
echo "答案为：$random_nu"
