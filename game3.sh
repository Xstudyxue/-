#!/bin/bash
#
declare -i x=5
declare -i y=5
declare -i len=4
declare -i x_arr=(1 2 3 4 5)
declare -i y_arr=(5 5 5 5 5)
dir='d'
init() {
	clear
	echo -e "\033[0m"
	echo -e "\033[4${2}m"
	echo -e "\033[4${1}m"
	echo -e "\033[?25l"
	gen_food
}
set_show() {
	clear
	for ((i = 1; i < $len; i++)); do
		echo -e "\033[${y_arr[$i]};${x_arr[$i]}H*\033[0m"
	done
	echo -e "\033[${y_arr[$i]};${x_arr[$i]}H$\033[0m"
	echo -e "\033[${randomy};${randomx}H#\033[0m"
	for ((i = 0; i <= 20; i++)); do
		echo -e "\033[20;${i}H@\033[0m"
		echo -e "\033[${i};20H@\033[0m"
	done
	echo -e "\033[21;0Hsnake:${x},${y}\033[0m"
	echo -e "\033[22;0Hfood :${randomx},${randomy}\033[0m"
}
move() {
	case $dir in
		"w") y=$y-1 ;;
		"s") y=$y+1 ;;
		"a") x=$x-1 ;;
		"q") exit ;;
		*) x=$x+1 ;;
	esac
	if [[ $x -eq $randomx && $y -eq $randomy ]]; then
		((len++))
		x_arr[$len]=$x
		y_arr[$len]=$y
		gen_food
		return
	fi
	if [[ $x -lt 1 || $y -lt 1 || $x -gt 19 || $y -gt 19 ]]; then
		exit;
	fi
	for ((i = 2; i <= $len; i++)); do
		if [[ $x -eq ${x_arr[$i]} && $y -eq ${y_arr[$i]} ]]; then
			exit;
		fi
	done
	for ((i = 0; i <= $len; i++)); do
		x_arr[$i]=${x_arr[$i+1]}
		y_arr[$i]=${y_arr[$i+1]}
	done
	x_arr[$len]=$x
	y_arr[$len]=$y
}
gen_food() {
	let flag=1
	while [ $flag -eq 1 ]; do
		let randomx=$(($RANDOM%18+1))
		let randomy=$(($RANDOM%18+1))
		for ((i=0;i
			if [[ ${x_arr[$i]} -eq $randomx && ${y_arr[$i]} -eq $randomy ]]; then
				break
			fi
		done
		if [ $i -eq $len ]; then
			flag=0
		fi
	done
}
init
set_show
while :; do
	olddir=$dir
	if ! read -n 1 -t 0.5 -s dir; then
		dir=$olddir
	fi
	sleep 0.0001
	move
	set_show
done
echo -e "\033[0m"
