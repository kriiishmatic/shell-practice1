#!bin/bash

#conditions

Number=$1
if [ $Number -lt 10 ] ; then
    echo " Given number $Number less than 10"
elif [ $Number -eq 10 ] ; then 
    echo " given number $Number equal to 10 "
else
    echo " Given number $Number greather than or equal to 10 "

fi

