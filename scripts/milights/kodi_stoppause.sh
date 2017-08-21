#!/bin/bash

cd /home/pi/domoticz/scripts/milights



for i in {10..1}             
do
./milight all B $i
	for x in $(seq 100); do   # do it slow
      	echo $i $x            	  # show value and slow down
      	done
done

./milight w; ./milight b 1
for i in {1..12}             
do
./milight all B $i
	for x in $(seq 100); do   # do it slow
      	echo $i $x            	  # show value and slow down
      	done

done