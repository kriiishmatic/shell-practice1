#!/bin/bash

userID=$(id -u)

if [ $userID -ne 0 ]; then
    echo " Error you dont have sudo previleges BOZO"
    exit 2
fi
 dnf install mysql -y
 
 if [ $? ne 0 ]; then 
    echo " Error: MYSQL cannot be installed "
    exit 2
else
    echo " Hurray! operation success RIPBOZO"
fi

