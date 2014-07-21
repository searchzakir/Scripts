#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

# logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

# Usage:
# sh Check-DNS-Propogation.sh simplexemail.com
# sh Check-DNS-Propogation.sh dialambulance.com

DOMAIN="$1"

for i in 4.2.2.1 4.2.2.2 4.2.2.3 4.2.2.4 4.2.2.5 4.2.2.6 8.8.8.8 8.8.4.4
do
echo "============================================================"
echo $i
#dig +short -t ns aayurshivaproperties.com @$i
dig +short -t ns $DOMAIN @$i
done

