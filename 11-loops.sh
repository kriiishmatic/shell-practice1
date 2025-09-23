#!/bin/bash
#colours
#####################


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R Get sudo access BOZO $N "
    exit 3
fi


#creating logs files
####################

shell_log="/var/log/shellsciptlog"

mkdir -p $shell_log

#removing .sh from file
#######################

Remove_sh=$( echo $0 | cut -d "." -f1 )

Logfile="$shell_log/$Remove_sh.log"

echo " Script started at :: $(date) " | tee -a $Logfile


Status(){
    if [ $1 -ne 0 ]; then
    echo -e " $R Failed $N to install $2  " | tee -a $Logfile
    exit 1
else
    echo -e "$G Sucessfully $N installed $2 " | tee -a $Logfile
fi
}

for package in $@
    do
    dnf list installed $package &>>$Logfile
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$Logfile
        Status $? "$package"
    else
        echo " $package is already installed ...$Y skipping $N "
    fi
done
