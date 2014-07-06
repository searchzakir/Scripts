#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"
#
# This script is to be run on the mail server itself
# Every postfix server/instance must have script remove-bogus-corrupted-mails.sh & run periodically [hourly,etc depending on the mail load on this server] via crontab
#

# The main aim of this script is to COUNT the TOTAL Number of Bogus Mails
# Ideally should be invoked by Cron at the end of the day [say .. 23:55:00] & thus should be entered in crontab file

# Initializing the Output File
File="/tmp/find-bogus-files-count-out.txt"
> $File


DAY=`date +%d`
Month=`date +%b`
#/bin/egrep "$Month $DAY" /var/log/messages | /bin/egrep 'remove-bogus-corrupted-mails' | /bin/awk '{print $10}' | /bin/awk '{total+=$0}END{print total}' > $File
/bin/egrep "$Month $DAY" /var/log/messages | /bin/egrep 'remove-bogus-corrupted'| /bin/awk -F 'deleted' '{print $1}' | /bin/awk -F 'remove-bogus-corrupted-mails.sh:' '{print $2}' | /bin/awk '{total+=$0}END{print total}' > $File
#cat $File
