#!/bin/bash
##同步备份服务器到热备服务器
#同步用户
rsync_user='root'
#同步源 nginx路径
local_dir='/data/'
#同步服务器IP
rsync_server='192.168.115.132'
#同步目标路径
backup_dir='/data/home/'
#本机地址
local_ip='192.168.115.131'
##同步时间
CURTIME=$(date +%F_%T.%N)
#同步日志
rsync_info='/data/rsync.info'
#同步异常日志
rsync_error='/data/rsync.error'
yum install rsync -y
rsync -avz -e "ssh -o stricthostkeychecking=no" --delete ${local_dir}  ${rsync_user}@${rsync_server}:${backup_dir} | tail -2 > ${rsync_info} 2> ${rsync_error}
if [ $? -eq 0 ];
then
##机器人地址
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=fe0e067c-451b-4e49-9c6a-9728a8e02db4'
TYPE='Content-Type: application/json'
MSG_TEXT_FILE='/tmp/msg.log'
##消息正文内容文件内容
cat >${MSG_TEXT_FILE}<<eof
消息详情如下
同步时间:${CURTIME}
本机地址:${local_ip}
同步目录名:${local_dir}
远程服务器:${rsync_server}
同步用户名:${rsync_user}
同步详细: 
----------------------
$(cat ${rsync_info})
----------------------
eof
##json消息体文件路径
MSG_JSON_FILE='/tmp/info.json'
##生成json消息体文件
cat >${MSG_JSON_FILE}<<EOF
{
"msgtype": "text",
"text": {
"content": "$(cat ${MSG_TEXT_FILE})"}}
EOF
##消息推送,正确的丢弃,错误的输出到文件pushinfoerr.log中
curl -s  ${ROBOT} -H "${TYPE}" -d "$(cat ${MSG_JSON_FILE})" >/dev/null  2>${WORKDIR}/pushinfoerr.log
fi
