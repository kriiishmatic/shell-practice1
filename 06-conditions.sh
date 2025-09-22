#!/bin/bash

echo "Enter the number : "
read Numb

if [ $((Numb % 2)) -eq 0 ]; then
    echo " Number $Numb is even "
else
    echo " Number $Numb is odd "
fi
