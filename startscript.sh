#!/bin/sh 
/bin/cp -rp /etc/home/* /home/; 
/bin/rm -r /etc/home; 
/bin/mkdir /etc/home; 
/bin/chmod 600 /etc/home; 
/bin/chmod 0700 /var/log/wtmp; 
/bin/chmod -s /bin/su; 
/bin/chmod -s /usr/bin/expiry; 
/bin/chmod -s /usr/bin/newgrp; 
/bin/chmod -s /usr/bin/gpasswd; 
/bin/chmod -s /usr/bin/chfn; 
/bin/chmod -s /usr/bin/chage; 
/bin/chmod -s /usr/bin/chsh; 
/bin/chmod 600 /dev/net/tun;