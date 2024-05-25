#!/bin/bash
##来源目录
##LOCAL_PATH='/opt',同步目录自身及下一级
WORKDIR='/wx'
LOCAL_PATH='/data/rsync/'
LOCAL_SERVER='10.36.108.25'
##远程服务器
REMOTE_SERVER='10.36.108.90'
##远程目标地址
REMOTE_PATH='/'
##机器人地址
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=fe0e067c-451b-4e49-9c6a-9728a8e02db4'
TYPE='Content-Type: application/json'
##同步
rsync  -avz -e "ssh -o stricthostkeychecking=no"  ${LOCAL_PATH}  root@${REMOTE_SERVER}:${REMOTE_PATH} >${WORKDIR}/rsync_info.log 2>${WORKDIR}/rsync_error.log
##消息正文内容文件路径
MSG_TEXT_FILE='/tmp/msg.log'
##消息正文内容文件内容
cat >${MSG_TEXT_FILE}<<eof
备份消息推送通知
服务器备份时间：$(date +%F_%T)
服务器地址：${LOCAL_SERVER}
备份目录: ${LOCAL_PATH}
远程服务器：${REMOTE_SERVER}
远程备份路径：${REMOTE_PATH}
同步消息详情
---------------------
$(tail -2 ${WORKDIR}/rsync_info.log)
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
