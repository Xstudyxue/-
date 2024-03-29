#!/bin/bash
#统计用户登录shell
declare -A shells
while read link
do
	type=`echo $link | awk -F":" '{print $7}'`
	let shells[$type]++
done < /etc/passwd

for i in ${!shells[*]}
do
	echo $i : ${shells[$i]}
done
