#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R Get sudo access BOZO $N "
    exit 3
fi

Status(){
    if [ $1 -ne 0];then
    echo -e " $R Failed $N to install $2  "
    exit 1
else
    echo -e "$G Sucessfully $N installed $2 "
fi

}

dnf list installed nginx
 if [ $? -ne 0]; then
    dnf install nginx -y
    Status $? "NGINX"
else 
 echo -e " Already have it installed $Y skipping $N "
 fi

dnf list installed mysql
  if [ $? -ne 0]; then
    dnf install mysql -y
    Status $? "MYSQLDDD"
else
    echo -e " Mysql insalled already sooo... $Y skipping $N "

fi
dnf list installed python3-pip
    if [ $? -ne 0]; then
    dnf install python3-pip -y
    Status $? "Python conda"
else
    echo -e " $Y skipping i cant "
fi

