#/bin/bash
#循环输出1到100的偶数
#sum=0
#for i in {1..100}
#do
#	x=$[i%2]
#	if [ $x -eq 0 ]
#	then
#		sum=$[sum+i]
#	fi
#done
#echo $sum

#循环输出passwd文件的第一列
#for i in `cat /etc/passwd`
#do
#	echo $i | awk -F":" '{print $1}' 
#done

#批量增加、删除用户，设置用户密码。
#i=01
#for i in {01..10}
#do
#	if [ $i -ne 05 ]
#	then
#	userdel -r user$i
#	useradd user$i
#	echo "pass$i" | passwd --stdin user$i &> /dev/null
#	fi
#done

#判断目录是否存在，并在目录内批量创建文件
#[ -d /haowan ] || mkdir /haowan
#i=1
#for i in {1..10}
#do
#	touch /haowan/up-$i
#	if [ $? -ne 0 ]
#	then
#	mkdir /haowan
#	fi
#done

#批量替换文件的指定内容
#i=1
#for i in `ls /haowan`
#do
#	 echo $i | sed 's/up/down/g'
#done
#echo

#打印九九乘法表
#x=1
#for x in {1 .. 9}
#do
#
#	for i in {1 .. 9}
#	do
#	if [ $i - le $x ]
#	then
#
#	k=$[ i*x]
#	#echo - n "$i*$x=$k
#	printf "% 8s" $i*$x=$k
#
#	fi
#	done
#echo
#done

#打印九九乘法表(c语言版)
for ((j=1; j <= 9; j++) )
do
	for ((i=1; i <= j; i++) )
	do
	k=$[ i*j]
	echo - n "$i*$j=$k\t"
	done
echo
done
