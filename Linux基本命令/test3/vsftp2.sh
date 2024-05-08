#!/bin/bash
# wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
# wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
ftp_user () {
groupadd qf2401
mkdir -p /data/qf2401
for USERNAME in `cat class_user`
do
        #number=`openssl rand -base64 40 | tr  -d '/+=' | cut -c 2-12`
        useradd -g qf2401 -d /data/qf2401/$USERNAME $USERNAME
        echo $USERNAME | passwd --stdin "$USERNAME"
        echo $USERNAME:$USERNAME >> /data/userinfo
        chmod 755 /data/qf2401/$USERNAME
        chown $USERNAME:qf2401 /data/qf2401/$USERNAME
        chown :qf2401 /data/qf2401
done
}
ftp_server () {
systemctl stop firewalld
systemctl disable firewalld
setenforce 0
sed -ri '/^SELINUX=/c SELINUX=disabled' /etc/selinux/config
yum -y install vsftpd
systemctl enable vsftpd
touch /etc/vsftpd/chroot_list
sed -ri '/^anonymous_enable=/c anonymous_enable=no' /etc/vsftpd/vsftpd.conf
sed -ri '/^#chroot_local_user=/c chroot_local_user=YES' /etc/vsftpd/vsftpd.conf
sed -ri '/^#chroot_list_enable=/c chroot_list_enable=YES' /etc/vsftpd/vsftpd.conf
sed -ri '/^#chroot_list_file=/c chroot_list_file=/etc/vsftpd/chroot_list' /etc/vsftpd/vsftpd.conf
sed -i '$a allow_writeable_chroot=YES' /etc/vsftpd/vsftpd.conf
sed -i '$a local_root=/data/qf2401' /etc/vsftpd/vsftpd.conf
sed -i '$a local_max_rate=0' /etc/vsftpd/vsftpd.conf
cat > /etc/vsftpd/vsftpd.conf <<eof
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=41000
idle_session_timeout=60
data_connection_timeout=60
eof
sed -ri '/^#xferlog_file=/var/log/xferlog/c xferlog_file=/var/log/xferlog' /etc/vsftpd/vsftpd.conf
#systemctl restart vsftpd
}
ftp_user
ftp_server
