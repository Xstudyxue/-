#!/bin/bash
echo '欢迎来到猜数游戏！'
while true
do
 read -p '开始/退出（y/n）：' x #提示用户输入
 if [ -z $x ] #判断用户输入为空
 then
 echo '不能为空' #提示
 echo ''
 continue
 elif [ $x = y ] #判断用户输入‘y'
 then
 echo ''
 echo '游戏即将开始'
 echo ''
 while true
 do
 sleep 1s #延迟1s
 echo '请选择难度' #难度选择
   echo ' 1.简单'
   echo ' 2.一般'
  echo ' 3.困难'
 echo ' 4.地狱'
 echo ' 5.返回'
 echo ''
   read -p '请输入对应序号：' y #提示用户输入
 if [ -z $y ] #判断用户输入为空
 then
 echo '不能为空' #提示
 echo ''
 continue
 elif [ $y = 1 ] #判断用户输入‘1'简单
 then
 while true
 do
  num=$[RANDOM%100+1] #随机生成100以内的数
  echo '猜一个1-100的数'
  n=0 #定义变量
  while true
  do
  read -p '请输入：' a #提示用户输入
  let n++ #计次数
  if [ -z $a ] #判断用户输入为空
  then
  echo '输入不能为空！' #提示
  continue
  elif [ -n "`echo $a | sed 's#[0-9]##g'`" ] #判断用户输入非数字
  then
  echo '请输入1-100之间的数！' #提示
  continue
  elif [ $a -lt 1 ] || [ $a -gt 100 ] #判断用户输入的数在1-100之间
  then
  echo '请输入1-100之间的数！' #提示
  continue
  elif [ $a -gt $num ] #判断用户输入的数大于随机生成的数
  then
  echo '猜大了，再猜！' #提示
  continue
  elif [ $a -lt $num ] #判断用户输入的数小于随机生成的数
  then
  echo '猜小了，再猜！' #提示
  continue
  else
  echo '恭喜你猜对了，正确数字是'$num #提示用户猜对了
  echo '猜了' $n '次' #显示猜的次数
  echo ''
  sleep 1s #延迟1s
  echo '是否再来一局？' #提示是否再玩
  while true
  do
  read -p 'y/n:' i #提示用户输入
  if [ -z $i ] #判断用户输入为空
  then
   echo '不能为空' #提示
   echo ''
   continue
    elif [ $i = y ] #判断用户输入‘y'
  then
   break 2
  elif [ $i = n ] #判断用户输入‘n'
  then
   break 3
  else
   echo '输入有误' #提示
   echo ''
   continue
  fi
  done
  fi
  done
 done
 
 elif [ $y = 2 ] #判断用户输入‘2'一般
 then
 while true
 do
  num=$[RANDOM%1000+1] #随机生成1000以内的数
  echo '猜一个1-1000的数' #提示
  n=0 #定义变量
  while true
  do
  read -p '请输入：' a #提示用户输入
  let n++ #记次数
  if [ -z $a ] #判断用户输入
  then
  echo '输入不能为空！' #提示
  continue
  elif [ -n "`echo $a | sed 's#[0-9]##g'`" ] #判断用户输入非数字
  then
  echo '请输入1-1000之间的数！' #提示
  continue
  elif [ $a -lt 1 ] || [ $a -gt 1000 ] #判断用户输入的在1-1000之间
  then
  echo '请输入1-1000之间的数！' #提示
  continue
  elif [ $a -gt $num ]
  then
  echo '猜大了，再猜！' #提示
  continue
  elif [ $a -lt $num ]
  then
  echo '猜小了，再猜！' #提示
  continue
  else
  echo '恭喜你猜对了，正确数字是'$num #提示用户猜对了
  echo '猜了' $n '次' #显示猜的次数
  echo ''
  sleep 1s #延迟1s
  echo '是否再来一局？' #提示是否继续玩
  while true
  do
  read -p 'y/n:' i #提示用户输入
  if [ -z $i ] #判断用户输入为空
  then
   echo '不能为空' #提示
   echo ''
   continue
    elif [ $i = y ] #判断用户输入‘y'
  then
   break 2
  elif [ $i = n ] #判断用户输入‘n'
  then
   break 3
  else
   echo '输入有误' #提示
   echo ''
   continue
  fi
  done
  fi
  done
 done
 
 elif [ $y = 3 ] #判断用户输入‘3'困难
 then
 while true
 do
  num=$[RANDOM%10000+1] #随机生成10000以内的数
  echo '猜一个1-10000的数' #提示
  n=0 #定义变量
  while true
  do
  read -p '请输入：' a #提示用户输入
  let n++ #记次数
  if [ -z $a ] #判断用户输入为空
  then
  echo '输入不能为空！' #提示
  continue
  elif [ -n "`echo $a | sed 's#[0-9]##g'`" ] #判断用户输入非数字
  then
  echo '请输入1-10000之间的数！' #提示
  continue
  elif [ $a -lt 1 ] || [ $a -gt 10000 ] #判断用户输入是否在1-10000之间
  then
  echo '请输入1-10000之间的数！' #提示
  continue
  elif [ $a -gt $num ] #判断输入的数大于随机生成数
  then
  echo '猜大了，再猜！' #提示
  continue
  elif [ $a -lt $num ] #判断输入的数小于随机生成数
  then
  echo '猜小了，再猜！' #提示
  continue
  else
  echo '恭喜你猜对了，正确数字是'$num #提示用户猜对了
  echo '猜了' $n '次' #提示
  echo ''
  sleep 1s #延迟1s
  echo '是否再来一局？' #提示是否继续玩
  while true
  do
  read -p 'y/n:' i #提示用户输入
  if [ -z $i ] #判断用户输入为空
  then
   echo '不能为空' #提示
   echo ''
   continue
    elif [ $i = y ] #判断用户输入‘y'
  then
   break 2
  elif [ $i = n ] #判断用户输入‘n'
  then
   break 3
  else
   echo '输入有误' #提示
   echo ''
   continue
  fi
  done
  fi
  done
 done
 
 elif [ $y = 4 ] #判断用户输入‘4'地狱
 then
 while true
 do
  num=$[RANDOM%100000+1] #随机生成100000以内的数
  echo '猜一个1-100000的数' #提示
  n=0 #定义变量
  while true
  do
  read -p '请输入：' a #提示用户输入
  let n++ #记次数
  if [ -z $a ] #判断用户输入为空
  then
  echo '输入不能为空！' #提示
  continue
  elif [ -n "`echo $a | sed 's#[0-9]##g'`" ] #判断用户输入非数字
  then
  echo '请输入1-100000之间的数！' #提示
  continue
  elif [ $a -lt 1 ] || [ $a -gt 100000 ] #判断用户输入1-100000之间
  then
  echo '请输入1-100000之间的数！' #提示
  continue
  elif [ $a -gt $num ] #判断输入的数大于随机生成数
  then
  echo '猜大了，再猜！' #提示
  continue
  elif [ $a -lt $num ] #判断输入的数小于随机生成数
  then
  echo '猜小了，再猜！' #提示
  continue
  else
  echo '恭喜你猜对了，正确数字是'$num #提示用户猜对了
  echo '猜了' $n '次' #显示猜的次数
  echo ''
  sleep 1s #延迟1s
  echo '是否再来一局？' #提示是否继续玩
  while true
  do
  read -p 'y/n:' i #提示用户输入
  if [ -z $i ] #判断用户输入为空
  then
   echo '不能为空' #提示
    echo ''
   continue
    elif [ $i = y ] #判断用户输入‘y'
  then
   break 2
  elif [ $i = n ] #判断用户输入‘n'
  then
   break 3
  else
   echo '输入有误' #提示
   echo ''
   continue
  fi
  done
  fi
  done
 done
 
 elif [ $y = 5 ] #判断用户选择返回
 then
 echo ''
 break #返回
 else #判断用户输入其他
 echo '输入有误' #提示
 echo ''
 continue
 fi
 done
 elif [ $x = n ] #判断用户输入‘n'退出
 then
 echo '游戏即将退出' #提示
 echo ''
 sleep 1s
 echo '退出成功！' #提示
 echo ''
 exit 0 #结束脚本
 else #判断用户输入其他
 echo '输入有误' #提示
 echo ''
 continue
 fi
done
