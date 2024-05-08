#/bin/bash
#安装
#yum install rsync -y
#环境
#systemctl enable rsyncd
#setenforce 0
#systemctl stop firewalld

#备份配置文件
#cp /etc/rsyncd.conf /etc/rsyncd.conf.bak
#修改配置文件
client_host_ip=103610880
client_password=`openssl rand -base64 40 | tr  -d '/+=' | cut -c 2-12`
cat > /etc/rsyncd.conf<<eof
uid = root
gid = root
use chroot = no
read only = no
#hosts allow=10.36.108.0/255.255.255.0
#hosts deny=*
max connections = 5
pid file = /var/run/rsyncd.pid
ecrets file = /etc/rsyncd/rsyncd.passwd
log file = /var/log/rsync.log
transfer logging = yes
log format = %t %a %m %f %b
syslog facility = local3
timeout = 300
[backup]
path = /data/backup/
list=yes
ignore errors=yes
auth users = backup
[rsync_file_$client_host_ip]
path = /data/$client_host_ip
list=yes
ignore errors=yes
auth users = rsync_user
# exclude = cache/
eof
mkdir -p /etc/rsyncd/  /data/backup/
mkdir -p /data/$client_host_ip/
#echo 'backup:123456' >>/etc/rsyncd/rsyncd.passwd
echo rsync_user:$rsync_password >> /etc/rsyncd/rsyncd.passwd
chmod 600 /etc/rsyncd/rsyncd.passwd
systemctl restart  rsyncd


#!/bin/bash
mkdir -p /data/file/
for i in {1..100}
do
number=`openssl rand -base64 40 | tr  -d '/+=' | cut -c 2-20`
touch /data/file/A_${number}.log
echo "10.36.108.80" > /data/file/A_${number}.log
done
echo "dbMZ3lcwP3p" > /rsyncd.passwd
chmod 600  /rsyncd.passwd