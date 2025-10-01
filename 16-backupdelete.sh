#!/bin/bash
#colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
Dest_dir=$2
Days=14

Test(){
    echo -e " $R Dynamic inputs not recieved $N "
}

if [ $# -lt 2 ]; then
    Test
fi
files=$(find $Source_dir -name "*.log" -mtime +$Days)

if [ ! -d $source_dir ]; then
    echo -e "$R Source $source_dir doesnt exist $N"
fi

if [ ! -d $Dest_dir ]; then
    echo -e "$R Source $Dest_dir doesnt exist $N"
fi
if [ -n $files ]; then # -z to chek if folder is not empty
    echo " Files found ::: $files "
    Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
    zipfilename=$Dest_dir/SCRIPT_LOGS-$Timestamp.zip
    echo " Zip file name ::: $zipfilename "
    find $source_dir -name "*.log" -mtime +$Days | zip -@ -j "$zipfilename"
    if [ -f "$zipfilename"]; then
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
