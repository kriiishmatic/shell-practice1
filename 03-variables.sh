#!bin/bash

#learning about date and time by crating variables

starttime=$(date +%s)

sleep 12 &

endtime=$(date +%s)

TT=$(($starttime-$endtime))

echo " Time taken to execute = $TT seconds "
