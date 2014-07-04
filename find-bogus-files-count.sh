#!/bin/bash
File=/tmp/find-bogus-files-count-out.txt
> $File
DAY=`date +%d`
Month=`date +%b`
#/bin/egrep "$Month $DAY" /var/log/messages | /bin/egrep 'remove-bogus-corrupted-mails' | /bin/awk '{print $10}' | /bin/awk '{total+=$0}END{print total}' > $File
/bin/egrep "$Month $DAY" /var/log/messages | /bin/egrep 'remove-bogus-corrupted'| /bin/awk -F 'deleted' '{print $1}' | /bin/awk -F 'remove-bogus-corrupted-mails.sh:' '{print $2}' | /bin/awk '{total+=$0}END{print total}' > $File
