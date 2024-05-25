#!/bin/bash
#安装工具包
#yum install epel-release -y
#yum install  inotify-tools  -y
#工作目录
DIRNAME='/data/app'
inotifywait -mrq  -e 'create,close_write' --timefmt "%Y-%m-%d_%H:%M:%S.%s" --format "%T %w%f %e"  "${DIRNAME}" | while read line
do
#导入指定文件变量
source ${PWD}/intoify_config.conf
##获取写入时间
CREATE_TIME=$(echo ${line} | awk '{print $1}')
##获取文件路径
LOCAL_SOURCE=$(echo ${line} | awk '{print $2}')
rsync -avz  ${DIRNAME}  ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/ >${RSYNC_INFO_PATH} 2>>${RSYNC_ERR_PATH}
###pushinfo
##消息正文内容文件内容
if [ "${OPEN_PUSH_INFO:-off}" == 'on' ];
then
cat >${MSG_TEXT_FILE}<<eof
标题:文件同步消息通知
服务器时间:${CREATE_TIME}
同步来源服务器:${LOCAL_SERVER_IP}
同步远程服务器:${REMOTE_HOST}
同步远程目录:${REMOTE_PATH}
日志详情:
____________
$(tail -2 ${RSYNC_INFO_PATH})
eof
##生成json消息体文件
cat >${MSG_JSON_FILE}<<EOF
{
"msgtype": "text",
"text": {
"content": "$(cat ${MSG_TEXT_FILE})"}}
EOF
##消息推送
curl -s  ${ROBOT} -H "${TYPE}" -d "$(cat ${MSG_JSON_FILE})" >/dev/null  2>${PUSH_ERR_LOG_PATH}
fi
done

