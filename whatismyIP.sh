#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"


#curl -L0 http://checkip.org | grep 'IP Address' | awk -F '>' '{ print $3 }' | awk -F '<' '{ print $1 }'

#curl -s ifconfig.me

curl http://wooledge.org/myip.cgi

#time curl ifconfig.me
#time curl http://wooledge.org/myip.cgi

