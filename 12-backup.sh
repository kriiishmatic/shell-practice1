#!bin/bash
sourcefile=/var/log/scriptlogs
script_name=$( echo $0 | cut -d "." -f1)
Timestamp=$(date +)
Log_file="$sourcefile/backup.log"
Days=14
userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
###Check_root
if ( $userid -ne 0 ); then
    echo "Run the scipt with Root Previliges "
    exit 1
fi

echo " Script execution started at $(date)" | tee -a $sourcefile
mkdir -p $sourcefile

### check source & backup folders ##
if ( ! -d "$sourcefile" -eq 0 ); then
    echo " $sourcefile doesnt not exist "
fi

#### Finding files #######
file=$(find $sourcefile -name "*.log" -mtime +7 )
