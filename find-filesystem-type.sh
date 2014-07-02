#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

/bin/logger -s " running script ($0) by user (`whoami`) and pid = ($$)"

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

