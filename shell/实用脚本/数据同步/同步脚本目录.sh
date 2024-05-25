#!/bin/bash

RSYNC_LOAD () {
WORKDIR='/shell'
RSYNC_INFO='/shell/rsync_info'
RSYNC_ERROR='/shell/rsync_error'
rsync -avz ./ xuetao@10.36.108.39:~/ | tail -2 > $RSYNC_INFO 2> $RSYNC_ERROR
##同步时间
CURTIME=$(date +%F_%T.%N)
#本机地址
LOCAL_HOST='10.36.108.80'
#同步目录名
SOURCE_DIR='/root/SFTP/test/shell'
#远程服务器
SERVER_HOST='10.36.108.39'
#同步用户名
USER_NAME='xuetao'
##机器人地址
ROBOT=''
TYPE='Content-Type: application/json'
MSG_TEXT_FILE='/tmp/msg.log'
##消息正文内容文件内容
cat >${MSG_TEXT_FILE}<<eof
消息详情如下
同步时间:${CURTIME}
本机地址:${LOCAL_HOST}
同步目录名:${SOURCE_DIR}
远程服务器:${SERVER_HOST}
同步用户名:${USER_NAME}
同步详细: 
----------------------
echo $(cat ${RSYNC_INFO})
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
}

RSYNC_LOAD
