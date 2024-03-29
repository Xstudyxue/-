#/bin/bash
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

#for i in `cat /etc/passwd`
#do
#	echo $i | awk -F":" '{print $1}' 
#done

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

#i=1
#for i in `ls /haowan`
#do
#	 echo $i | sed 's/up/down/g'
#done
#echo

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

for ((j=1; j <= 9; j++) )
do
	for ((i=1; i <= j; i++) )
	do
	k=$[ i*j]
	echo - n "$i*$j=$k\t"
	done
echo
done
