#!/bin/sh
/bin/mount -o remount,rw,nodev,nosuid,noexec /media/usb
/bin/sh /media/usb/files/rr.sh &
/bin/sh /etc/files/noroot.sh
/usr/bin/passwd -l admin
/bin/dmesg -n 8
killit="$(/bin/ps -ef | /bin/grep "login" | /bin/grep "admin" | /usr/bin/awk '{ print $1 }')"
/bin/kill "$killit"
/bin/chown root:root /dev/tty1 