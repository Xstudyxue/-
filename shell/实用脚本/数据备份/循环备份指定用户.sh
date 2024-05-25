#!/bin/bash
#循环备份指定用户脚本目录并只保留最近两天的备份文件
for i in $(cat /root/SFTP/test/shell/group_user)
do
tar -azf /data/backup/$i/$(date +%Y-%m-%d-%H-%M).tar.gz /data/qf2401/$i/* 
find /data/backup -name "*.tar.gz" -type f -mtime +2 -exec rm -f {} \;
WORKDIR='/shell'
ROBOT=''
TYPE='Content-Type: application/json'
MSG_TEXT_FILE='/tmp/msg.log'
##消息正文内容文件内容
cat >${MSG_TEXT_FILE}<<eof
echo "$i脚本目录备份成功"
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
done
#定时任务
#cat >>/var/spool/cron/root<<eof
#00 9-23/2 * * * /bin/bash /root/SFTP/test/shell/backup.sh &> /dev/null
#eof
