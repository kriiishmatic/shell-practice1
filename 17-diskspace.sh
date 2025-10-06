#!/bin/bash

Disk_usage=$(df -hT | grep -v Filesystem)
Disk_limit=2
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
usage=$($line | awk -F '{print $6}')
Part=$($line | awk -F '{print $7}')
if [ $usage -ge $Disk_limit ]; then
    Message= High disk space Usage ::: $Part:$usage server with IP:: $IP 
fi
done <<<$Disk_usage

 echo -e " $Message "

#18-mail.sh "kriiishmatic@gmail.com" "Highest alert" "Disk usage high alert" "$Message" "$IP" "devops team"

