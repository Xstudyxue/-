#!/bin/bash
##监控路径
WORK_DIR='/var/log/'
SERVICES='sshd'
LOG_ERROR_KEY='Failed|error'
##监控排除
EXCLUDE_LIST=$(ls ${WORK_DIR} | xargs echo | sed 's/ /|/g' | sed 's/secure|//')
inotifywait -mrq  -e 'modify' --timefmt "%b %d %H:%M:%S" --format "%T %w%f %e" --exclude "${EXCLUDE_LIST}" "${WORK_DIR}" | while read line
do
##获取唯一写入时间值
GET_TIME=$(echo ${line} | awk '{print $1,$2,$3}' | uniq)
##获取文件名称
GET_log=$(echo ${line} | awk '{print $4}' | uniq)
##根据时间戳，截取错误日志详情内容
GET_MSG_LOG=$(grep "${GET_TIME}" ${GET_log} | grep "${SERVICES}") | grep -E "${LOG_ERROR_KEY}"
if [ -n "${GET_MSG_TXT}" ];then
echo ${GET_MSG_LOG}

MSG_TEXT_FILE='/tmp/inotifywait.log'
cat >${MSG_TEXT_FILE}<<eof
标题:ssh监控错误日志
当前时间点:${date +%F_%T}
当前主机IP:$(hostname -I)
服务名称:${SERVICES}
异常日志：
---------------------
${GET_MSG_LOG}
---------------------
eof
##生成json消息体文件
cat >${MSG_JSON_FILE}<<EOF
{
"msgtype": "text",
"text": {
"content": "$(cat ${MSG_TEXT_FILE})"}}
EOF
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=fe0e067c-451b-4e49-9c6a-9728a8e02db4'
TYPE='Content-Type: application/json'
##消息推送
curl -s  ${ROBOT} -H "${TYPE}" -d "$(cat ${MSG_JSON_FILE})" >/dev/null  2>${PUSH_ERR_LOG_PATH}
fi
done
