#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

# sysdig.org says : 
# Sysdig is open source, system-level exploration: capture system state and activity from a running Linux instance, then save, filter and analyze.
# Think of it as strace + tcpdump + lsof + awesome sauce.
# With a little Lua cherry on top.

# A New System Troubleshooting Tool
# Built for the Way You Work


yum install curl -y
cd /tmp
wget https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public
rpm --import DRAIOS-GPG-KEY.public
curl -s -o /etc/yum.repos.d/draios.repo http://download.draios.com/stable/rpm/draios.repo
wget http://mirror.us.leaseweb.net/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
yum install kernel-devel-$(uname -r) -y
yum install dkms sysdig -y
cd ~

logger -s "For detailed examples of Sysdig command & usage, kindly refer this link -- https://github.com/draios/sysdig/wiki/Sysdig-Examples "
logger -s "FYI, some commands are commented here in this script $0 "

# Troubleshooting Compromised Server:
# http://draios.com/fishing-for-hackers/
# http://draios.com/fishing-for-hackers-part-2/

# Examples
# https://github.com/draios/sysdig/wiki/Sysdig-Examples
# https://github.com/draios/sysdig/wiki
#
# See the top processes in terms of network bandwidth usage:
# sysdig -c topprocs_net
# List all the incoming connections that are not served by apache:
# sysdig -p"%proc.name %fd.name" "evt.type=accept and proc.name!=httpd"
# See the top processes in terms of disk bandwidth usage:
# sysdig -c topprocs_file
# See the top processes in terms of I/O errors:
# sysdig -c topprocs_errors
#
