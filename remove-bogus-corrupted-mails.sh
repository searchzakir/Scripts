#!/bin/bash
# Checking bogus-corrupted-mails in the postfix mail queues
postsuper -p 2> /tmp/zPlayground/postsuper.out
COUNT=`wc -l /tmp/zPlayground/postsuper.out | awk '{print $1}'`
# Chips & Fries
if [ -s /tmp/zPlayground/postsuper.out ]
then
for i in `awk -F '/' '{print $2}' /tmp/postsuper.out`
do
rm -f /var/spool/postfix/incoming/$i
done
postsuper -p
postsuper -s
#echo "`date +%d.%m.%y` : remove-bogus-corrupted-mails.sh: $COUNT deleted" | logger
echo "[`date | cut -c 5-10`] : remove-bogus-corrupted-mails.sh: $COUNT deleted" | logger
#echo "$COUNT bogus-corrupted-mails deleted from server `hostname`" | mail -s "$COUNT bogus-corrupted-mails deleted from server `hostname`" sysad@bmesrv.com
else
echo > /dev/null
fi

# Truncating output file again
> /tmp/zPlayground/postsuper.out
