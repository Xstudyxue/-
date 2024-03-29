#/bin/bash
#基于端口自动化部署
yum -y install httpd
mkdir /var/www/hdl
cd /root
unzip hdl.zip
cp -r hdl/* /var/www/hdl
sed -i '/Listen 80/a Listen 81' /etc/httpd/conf/httpd.conf
systemctl restart httpd
cat > /etc/httpd/conf.d/test1.conf << eof
<VirtualHost *:81>  
ServerName  localhost
DocumentRoot  /var/www/hdl
</VirtualHost>
eof

systemctl restart httpd
