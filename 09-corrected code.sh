#!/bin/bash

# ==============================
# Color Codes
# ==============================
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " ${R}Get sudo access BOZO${N} "
    exit 3
fi

# ==============================
# Status Function
# ==============================
Status() {
    if [ $1 -ne 0 ]; then
        echo -e " ${R}Failed${N} to install $2 "
        exit 1
    else
        echo -e " ${G}Successfully${N} installed $2 "
    fi
}

# ==============================
# Install Nginx
# ==============================
dnf list installed nginx &>/dev/null
if [ $? -ne 0 ]; then
    dnf install -y nginx
    Status $? "NGINX"
else
    echo -e " ${Y}Skipping${N}, Nginx already installed "
fi

# ==============================
# Install MySQL
# ==============================
dnf list installed mysql-server &>/dev/null
if [ $? -ne 0 ]; then
    dnf install -y mysql-server
    Status $? "MySQL"
else
    echo -e " ${Y}Skipping${N}, MySQL already installed "
fi

# ==============================
# Install Python3-pip
# ==============================
dnf list installed python3-pip &>/dev/null
if [ $? -ne 0 ]; then
    dnf install -y python3-pip
    Status $? "Python3-pip"
else
    echo -e " ${Y}Skipping${N}, Python3-pip already installed "
fi
