#!/bin/bash
 count=5
    echo " Starting countdown "
 while [ $count -gt 0 ];
    do
    sleep 1 
    echo " count=$((count-1)) "
    done
    echo " Time is up "
