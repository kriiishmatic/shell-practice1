#!/bin/bash

Disk_usage=$(df -hT | grep -v Filesystem)
Disk_limit=2
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)


usage=$($Disk_usage | awk -F '{print 6F}')
Part=$($Disk_usage | awk -F '{print 7F}')
if [ $usage -ge $Disk_limit ]; then
    echo "Message : High disk space in $IP "
fi

