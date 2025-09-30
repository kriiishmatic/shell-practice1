#!/bin/bash

source_dir=/home/ec2-user/app_log

filetodelete=$(find -name "*.log" -mtime +24)
while IFS= read -r filebirth
    do
    echo " Deleting file :::$filebirth "
    echo " DELETED file  :::$filebirth "
    done
