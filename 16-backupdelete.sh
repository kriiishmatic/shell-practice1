#!/bin/bash
#colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
Dest_dir=$2
Days=14
log_folder=/var/log/shell-script
script_name=$(echo $0 | cut -d "." -f1)
log_file="$logfolder/backupdelete.log"

mkdir -p $log_folder
echo "script started executing at $(date)" | tee -a $log_file
Test(){
    echo -e " $R Dynamic inputs not recieved $N "
    exit 2
}

if [ $# -lt 2 ]; then
    Test
fi
files=$(find $source_dir -name "*.log" -mtime +$Days)

if [ ! -d $source_dir ]; then
    echo -e "$R Source $source_dir doesnt exist $N"
fi

if [ ! -d $Dest_dir ]; then
    echo -e "$R Source $Dest_dir doesnt exist $N"
fi
if [ -n "$files" ]; then
    echo " Files found ::: $files "
    Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
    zipfilename=$Dest_dir/SCRIPT_LOGS-$Timestamp.zip
    echo " Zip file name ::: $zipfilename "
    find $source_dir -name "*.log" -mtime +$Days | zip -@ -j "$zipfilename"
    if [ -f "$zipfilename" ]; then
        echo -e " $G Files successfully archieved $N"
        while IFS= read -r filepath #deleting using while loop
            do 
            echo " Deleting files $filepath "
            rm -rf $filepath
            echo " Deleted $filepath :::Clean up "
            done <<< $files
    else 
    echo " $R No files found to archieve $N "
    fi
    else 
    echo " $Y No files found $N "
fi
