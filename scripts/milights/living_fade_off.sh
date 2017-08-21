#!/bin/bash

cd /home/pi/domoticz/scripts/milights

for i in {12..1}             
do
./milight all B $i
	for x in $(seq 100); do   # do it slow
      	echo $i $x            	  # show value and slow down
      	done

done
#./milight all off