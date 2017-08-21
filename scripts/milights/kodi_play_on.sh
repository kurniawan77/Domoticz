#!/bin/bash

cd /home/pi/domoticz/scripts/milights

for i in {12..3}             
do
./milight all B $i
	for x in $(seq 100); do   # do it slow
      	echo $i $x            	  # show value and slow down
      	done
done
for i in {3..1}
do
./milight 1 B $i
	for x in $(seq 100); do
	echo $i $x
	done
done

./milight 1 C 5; ./milight 1 b 1

for i in {1..10}             
do
./milight 1 B $i
	for x in $(seq 100); do   # do it slow
      	echo $i $x            	  # show value and slow down
      	done
done

