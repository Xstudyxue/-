#/bin/bash
#基于端口自动化部署
#检测是否安装apache服务
(rpm -qa | grep httpd) || yum -y install httpd
mkdir /var/www/hdl
cd /root
unzip hdl.zip
# 将加压后的文件复制到指定路径
cp -r hdl/* /var/www/hdl
# 在80端口后新添加81端口，监听端口
sed -i '/Listen 80/a Listen 81' /etc/httpd/conf/httpd.conf
systemctl restart httpd
# 添加虚拟端口81
cat > /etc/httpd/conf.d/test1.conf << eof
<VirtualHost *:81>  
ServerName  localhost
DocumentRoot  /var/www/hdl
</VirtualHost>
eof

systemctl restart httpd
