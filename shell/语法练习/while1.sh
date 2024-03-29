#!/bin/bash
#++ i 是先自加1后赋值;i ++ 是先赋值后自加1。
while read line
do
	host[i++]=$line
done </etc/hosts
for i in ${!host[@]}
do
	echo "$i:${host[i]}"
done
