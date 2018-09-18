#!/usr/bin/expect

set timeout 630
spawn sh /root/grn-4.6-sp3-linux.bin
expect "More--("
send -- " \n"
expect "yes or no"
send -- "yes\n"
expect "id"
send -- "cbgrn_01\n"
expect "yes or no"
send -- "yes\n"
interact
exit
