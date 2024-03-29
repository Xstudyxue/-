#!/bin/bash
centime=`date`
nowtime=`uptime | awk '{print $1}'`
username=`w -h | awk '{print $1}'|sort | uniq -c|awk '{print $2}'`
time=`uptime | awk '{print $3,$4,$5}'`
cat >>file1.txt <<EOF
echo "时间: $centime"
echo "系统的当前时间: $nowtime"
echo "系统已运行的时长是: $time"
echo "系统登录的用户有: $username"
EOF
