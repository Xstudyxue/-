#!/bin/bsdh
user=$(cat /opt/user.txt)

for i in $user
do
	userdel -rf $i
done
