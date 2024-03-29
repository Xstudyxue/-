#!.bin.bash
i=1
while [ $i -le 10 ]
do
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
