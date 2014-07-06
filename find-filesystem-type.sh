#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

/bin/logger -s " running script ($0) by user (`whoami`) and pid = ($$)"

# just a random simple script to find the file system type on the server
# this can be invoked on the servers remotely & can be parsed to some other script for info gathering
# but again there are better tools available than this script to get the job done :)

echo "P.S. There are many ways to find the FS Type of the system ..."
echo
echo
echo ======================================================================
echo "cat /proc/filesystems | grep -v nodev | grep -v iso"
cat /proc/filesystems | grep -v nodev | grep -v iso
echo ======================================================================
echo
echo "df -T | egrep -v 'Type|tmpfs' | awk -F ' ' '{print \$1,\$2}'"
df -T | egrep -v 'Type|tmpfs' | awk -F ' ' '{print $1,$2}'
echo ======================================================================
echo
echo "cat /etc/mtab | egrep -v '^#|none|proc|sysfs|devpts|tmpfs' | awk -F ' ' '{print \$1,\$2,\$3}'"
cat /etc/mtab | egrep -v '^#|none|proc|sysfs|devpts|tmpfs' | awk -F ' ' '{print $1,$2,$3}'
echo ======================================================================
echo

