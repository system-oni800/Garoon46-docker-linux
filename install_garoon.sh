#!/usr/bin/expect

set timeout 630
spawn sh /root/garoon-linux-x64.bin
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "More--("
send -- " \n"
expect "yes or no"
send -- "yes\n"
expect "cbgrn"
send -- "cbgrn_01\n"
expect "1|2]"
send -- "1\n"
expect "/usr/local/cybozu"
send -- "\n"
expect "Enter Password:"
send -- "__GRDBPW__\n"
expect "Enter Password:"
send -- "__GRDBUSR__\n"
expect "Enter Password:"
send -- "__GRNPW__\n"
expect "/var/www/cgi-bin"
send -- "\n"
expect "/var/www/html"
send -- "\n"
expect "]:"
send -- "apache\n"
expect "yes or no"
send -- "yes\n"
interact
exit
