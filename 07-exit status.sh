#!/bin/bash

userID=$(id -u)

if [ $userID -ne 0 ] ; then
    echo " Error you dont have sudo previleges"
fi
 dnf install mysql -y
 
 if [ $? ne 0 ] ; then 
    echo " Error: MYSQL cannot be installed "
else
    echo " Hurray! operation success "
fi

