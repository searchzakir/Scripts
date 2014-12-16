#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"


proc_cpuinfo_count=$(expr `cat /proc/cpuinfo | grep processor | tail -1 | awk -F ':' '{print $2}'` + 1)
echo "From /proc/cpuinfo location,      CPU Core Count is: $proc_cpuinfo_count"

lscpu_count=`lscpu | grep CPU\(s\): | grep -v NUMA | awk '{print $2}'`
echo "From lscpu command,               CPU Core Count is: $lscpu_count"

nproc_count=`nproc`
echo "From nproc command,               CPU Core Count is: $nproc_count"
