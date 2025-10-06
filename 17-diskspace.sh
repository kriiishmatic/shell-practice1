#!/bin/bash

#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # in project we keep it as 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MESSAGE+="High Disk usage on $PARTITION: $USAGE % <br>" # escaping
    fi
done <<< $DISK_USAGE

echo -e "Message Body: $MESSAGE"

sh 18-mail.sh "kriiishmatic@gmail.com" "Highest alert" "Disk usage::high alert" "$Message" "$IP" "devops team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5

