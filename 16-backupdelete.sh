#!/bin/bash
#colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Source_dir=$1
Dest_dir=$2
Days=14

Test(){
    echo -e " $R Dynamic inputs not recieved $N "
}

if [ $# -le 2 ]; then
    Test
fi
files=$(find $Source_dir -name "*.log" -mtime +$Days)

if [ ! -d $source_dir ]; then
    echo -e "$R Source $source_dir doesnt exist $N"
fi

if [ ! -d $Dest_dir ]; then
    echo -e "$R Source $Dest_dir doesnt exist $N"
fi
if [ -z $files ]; then # -z to chek if folder is empty
    echo " Files found ::: $files "
    Timestamp=$(date + %Y-%m-%d-%H-%M-%S)
    zipfilename=$Dest_dir/SCRIPT_LOGS-$Timestamp.zip
    echo " Zip file name ::: $zipfilename "
    find $source_dir -name "*.log" -mtime +$Days | zip -@ -j "$zipfilename"
    if [ -d "$zipfilname"]; then
        echo " $G Files successfully archieved "
    else
        echo " $R files not found to archieve "
    fi
    while IFR= read -r filepath 
    do 
    echo " files found to archive :::$files "
    echo " Deleting $files :::Clean up "
    done <<< $files
    else 
    echo " $R No files found to archieve $N "
fi
