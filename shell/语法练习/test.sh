#!/bin/bash
read -p "number:" nu
if [  $nu -ge 1 -a  $nu -le 100 ]
then
	if [ $nu -ge 81 -a $nu -le 100 ]
	then
		echo "优秀"
	elif [ $nu -ge 60 -a $nu -le 80 ]
	then
		echo "良好"
	else
		echo '真菜'
	fi
else
	echo "给你一脚！" || exit
fi
