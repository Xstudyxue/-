#!.bin.bash
#批量创建、删除用户，并判断是否存在，存在则不创建
i=1
while [ $i -le 10 ]
do
	#不创建test5用户
	#if [ $i -ne 5 ]
	#then
		#userdel -r test$i
		#echo "user test$i delete successfully."
		#useradd test$i
		#echo "pass$i" | passwd --stdin test$i
###
id test$i &> /dev/null
if [ $? -ne 0 ]
then
	echo test$i
else
	userdel -r test$i
fi		
let i++
	#else
	#	let i++
	#	continue
	#fi
done
