curl直接以text格式推送至机器人
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=d3fc20e6-71ab-42f8-80fc-d63c7deb9e6e'
TYPE='Content-Type: application/json'
curl ${ROBOT} -H "${TYPE}" -d \
'{
"msgtype": "text",
"text": {
"content": "
hello1
hello2
hello3
"}}'



curl读取消息体内容推送消息至机器人
定义json消息体文件,text格式
cat >/root/test<<EOF
{
"msgtype": "text",
"text": {
"content": "测试"}}
EOF
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=47b6abb6-6894-40d5-bfcc-cb63f38cdce'
TYPE='Content-Type: application/json'
curl ${ROBOT} -H "${TYPE}" -d "$(cat /root/test)"


cat >/tmp/info.log<<eof
要发送的消息文字放在文件中
eof

定义json消息体文件,text格式
cat >/tmp/msg.log<<EOF
{
"msgtype": "text",
"text": {
"content": "$(cat /tmp/info.log)"}}
EOF
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=fe0e067c-451b-4e49-9c6a-9728a8e02db4'
TYPE='Content-Type: application/json'
curl ${ROBOT} -H "${TYPE}" -d "$(cat /tmp/msg.log)"
