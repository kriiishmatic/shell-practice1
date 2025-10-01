#!/bin/bash

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

Test(){
    echo " $R Not given enough dynamic inputs $N "
}

if [ $# -lt 2 ]; then
    Test
    else 
    echo -e "$G great you got the point $N"
fi
