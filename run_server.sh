#!/bin/bash

# Usage: ./run_server.sh {user_name} {password} {minutes}
# It will automatically bounce the server every 20 minutes to force reauth

let minutes=$3
echo $minutes
let iterations=$minutes/20
echo $iterations
let last=$minutes%20
echo $last

let i=0
while [ $i -lt $iterations ]
do
    echo "Iteration: $i"
    timeout 20m python example.py -u $1 -p $2 -l "Pier 39 San Francisco" -st 8 -P 9001 -H 0.0.0.0 -ar 5000 -i "pidgey,rattata,zubat,Psyduck,Magikarp,Tentacool,Oddish,Weedle,Caterpie,Spearow,Paras,Venonat,Goldeen,Kakuna,Doduo,Seaking,Pidgeotto"
    echo "done"
    i=$[$i+1]
done

timeout ${last}m python example.py -u $1 -p $2 -l "Pier 39 San Francisco" -st 8 -P 9001 -H 0.0.0.0 -ar 5000 -i "pidgey,rattata,zubat,Psyduck,Magikarp,Tentacool,Oddish,Weedle,Caterpie,Spearow,Paras,Venonat,Goldeen,Kakuna,Doduo,Seaking,Pidgeotto"
