#!/bin/bash

source_dir=/home/ec2-user/app_log

if ( ! -d $source_dir ); then 
    echo " $source_dir doesnot exist "
    exit1
    else 
    echo " Proceeding to FIND log files older than 14 days "
    fi
filetodelete=$(find $source_dir -name "*.log" -mtime +24)
while IFS= read -r filebirth
    do
    echo " Deleting file :::$filebirth "
    echo " DELETED file  :::$filebirth "
    done <<<$filetodelete
