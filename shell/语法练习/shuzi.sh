#!bin/bash
read -p "请输入:" get
case $get in
[0-9][0-9]*)
		echo -e "你输入是数字。\n"
		;;
*)
		echo -e "你输入的不是数字。\n"
		;;
esac
