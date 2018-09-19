#!/bin/bash
date
/usr/bin/systemctl start httpd
/usr/bin/systemctl enable httpd

/root/install_garoon.sh | tee log1.log

# install sp3
systemctl stop httpd
/etc/init.d/cyss_cbgrn_01 stop

/root/install_sp.sh | tee log2.log

mv -f /root/session_handler.csp /var/www/cgi-bin/cbgrn_01/code/include/fw/
chown apache:root /var/www/cgi-bin/cbgrn_01/code/include/fw/session_handler.csp
chmod 664 /var/www/cgi-bin/cbgrn_01/code/include/fw/session_handler.csp

/etc/init.d/cyss_cbgrn_01 start
systemctl  start httpd

date
echo "Delete.."
rm -f *.bin
