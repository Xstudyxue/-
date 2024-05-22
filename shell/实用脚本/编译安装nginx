#!/bin/bash
#编译环境的准备
nginx_install () {
systemctl stop firewalld
setenforce 0
mkdir -p ${WORKDIR}
WORKDIR='/data/soft'
VERSION='1.16.1'
#URL="https://nginx.org/download/nginx-${VERSION:-1.24.0}.tar.gz"
INSTALL_URL='http://10.36.108.254/soft'
INSTALL_PATH='/usr/local/nginx'
INSTALL_VAR=''
yum -y install gcc make zlib-devel pcre pcre-devel openssl-devel vim wget
wget -P ${WORKDIR} ${INSTALL_URL}/nginx-${VERSION}.tar.gz
tar -xzf ${WORKDIR}/nginx-${VERSION}.tar.gz -C ${WORKDIR}
cd ${WORKDIR}/nginx-${VERSION} && ./configure --user=www --group=www --prefix=${INSTALL_PATH} \
--group=root \
--user=root \
--with-http_stub_status_module \
--with-http_v2_module \
--with-http_ssl_module \
--with-http_gzip_static_module \
--with-http_realip_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-stream \
--with-stream_ssl_module \
--with-stream_realip_module
${INSTALL_VAR} && make && make install
useradd www
${INSTALL_PATH}/sbin/nginx
}
rsync_conf () {
#同步用户
rsync_user='root'
#同步源 nginx网站路径
rsync_dir='/usr/local/nginx/conf/'
#同步服务器IP
rsync_server='192.168.115.131'
#同步目标路径
backup_dir='/data/backup/192.168.115.130/nginx/conf/'
#本机地址
local_ip='192.168.115.130'
##同步时间
CURTIME=$(date +%F_%T.%N)
#同步日志
rsync_info='/data/rsync.info'
#同步异常日志
rsync_error='/data/rsync.error'
rsync  -avz -e "ssh -o stricthostkeychecking=no" --delete ${rsync_dir}  ${rsync_user}@${rsync_server}:${backup_dir} | tail -2 > ${rsync_info} 2> ${rsync_error}
}
pull_info () {
##机器人地址
ROBOT='https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=fe0e067c-451b-4e49-9c6a-9728a8e02db4'
TYPE='Content-Type: application/json'
MSG_TEXT_FILE='/tmp/msg.log'
##消息正文内容文件内容
cat >${MSG_TEXT_FILE}<<eof
消息详情如下
同步时间:${CURTIME}
本机地址:${local_ip}
同步目录名:${rsync_dir}
远程服务器:${rsync_server}
同步用户名:${rsync_user}
同步详细: 
----------------------
echo $(cat ${rsync_info})
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
#nginx_install
rsync_conf
if [ $? -eq 0 ];
then
pull_info
fi




