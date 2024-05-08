#!/bin/bash
#同步命令
#cat > /rsyncd.passwd <<eof
#mVdEA9C7wWr
#eof
for user_name in `cat /root/class_user`
do
#client_ip='10.36.108.80'
#mkdir -p /data/qf2401/$user_name
#chmod 600 /rsyncd.passwd
#将自己数据同步至服务器
rsync -avz --progress /data/qf2401/$user_name/  rsync_user@10.36.108.90::rsyncdata/$user_name --password-file=/rsyncd.passwd
done
#将服务器数据同步至本地
#rsync -avz --progress rsync_user@10.36.108.90::rsyncdata/$client_ip /data/qf2401/$client_name --password-file=/rsyncd.passwd
