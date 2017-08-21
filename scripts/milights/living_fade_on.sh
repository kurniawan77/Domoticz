#!/bin/bash

cd /home/pi/domoticz/scripts/milights

./milight b 1
sleep 0.2
./milight w
sleep 0.2
for i in {1..12}             
do
./milight all B $i
	for x in $(seq 100); do   # do it slow
      	echo $i $x            	  # show value and slow down
      	done

done