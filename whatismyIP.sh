#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

# On a Virtual Machine, be it either on my laptop or the EC2 or the VM's that I've created on the base servers using OpenVZ
# Many times it is required to know the IPv4 Address attached to it
# & Thus this small 1-liner script comes to rescue the situation & make the job trivial
#
#

#curl -L0 http://checkip.org | grep 'IP Address' | awk -F '>' '{ print $3 }' | awk -F '<' '{ print $1 }'

#curl -s ifconfig.me

curl http://wooledge.org/myip.cgi

#time curl ifconfig.me
#time curl http://wooledge.org/myip.cgi
# As of today, the wooledge.org is much much faster than ifconfig.me
