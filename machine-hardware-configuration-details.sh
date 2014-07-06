#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"


# It is always better to know first hand the machine's or server's hardware configuration
# If you want to have Virtual Machines, then script can be handy to know info about the main server on which the VM's will be forked, as & when required
# 

# Initialising the Script Output File
OUT="/tmp/machine-hardware-configuration-details-`hostname -f`.out"
> $OUT

echo -e "\n\n" >> $OUT
echo "Installing necessary packages to get the information of machine hardware configurations ..." >> $OUT 2>&1
echo "Commands that will be used in this script are ... fdisk,df,free,smartctl,lscpu,cpuid,nproc,dmesg,lshw,lsblk,lspci,dmidecode,hdparm,badblocks,sginfo" >> $OUT 2>&1
echo 
yum install lshw* util-linux-ng* procps* dmidecode* pciutils* e2fsprogs* hdparm* cpuid* coreutils* sg3_utils* gsmartcontrol* -y

echo -e "\n\n\n" >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command fdisk -l :" >> $OUT
echo >> $OUT
fdisk -l >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command df -h :" >> $OUT
echo >> $OUT
df -h >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command free -mt :" >> $OUT
echo >> $OUT
free -mt >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command smartctl -a `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'` :" >> $OUT
echo >> $OUT
smartctl -a `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'`
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command lscpu :" >> $OUT
echo >> $OUT
lscpu >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command cpuid :" >> $OUT
echo >> $OUT
cpuid >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command nproc --all :" >> $OUT
echo >> $OUT
nproc --all >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command dmesg :" >> $OUT
echo >> $OUT
dmesg >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command lshw :" >> $OUT
echo >> $OUT
lshw >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command lsblk :" >> $OUT
echo >> $OUT
lsblk >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command lspci -nv :" >> $OUT
echo >> $OUT
lspci -nv >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command dmidecode :" >> $OUT
echo >> $OUT
dmidecode >> $OUT
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command hdparm -I `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'` :" >> $OUT
echo >> $OUT
for i in `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'`
do
hdparm -I $i >> $OUT
done
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command hdparm -tT `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'` :" >> $OUT
echo >> $OUT
for i in `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'`
do
hdparm -tT $i >> $OUT
done
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command badblocks -s `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'` :" >> $OUT
echo >> $OUT
for i in `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'`
do
badblocks -s $i >> $OUT
done
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command sginfo -a `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'` :" >> $OUT
echo >> $OUT
for i in `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'`
do
sginfo -a $i >> $OUT
done
echo >> $OUT
echo "=================================================================================================================" >> $OUT
echo >> $OUT
echo "### Output of command sginfo -g `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'` :" >> $OUT
echo >> $OUT
for i in `fdisk -l | egrep "Disk /dev/.da" | awk -F ' ' '{print $2}' | awk -F ':' '{print $1}'`
do
sginfo -g $i >> $OUT
done
echo -e "\n\n" >> $OUT

