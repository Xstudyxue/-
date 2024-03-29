#!/bin/bash
while true
do
	read -p "请输入[1/2]" num1
	case $num1 in
	1)
		echo $num1
		;;
	2)
		while true
		do
			read -p "再次输入[1/2]:" num2
				case $num2 in
				1) echo $num2;;
				2) exit;;
				esac
		done
		;;
	esac
done
