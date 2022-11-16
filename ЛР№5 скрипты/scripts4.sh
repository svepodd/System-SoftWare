#!/bin/bash

for ((i=1; i<=$1; i++)); do
for ((k=$(($1-$i)); k>=0; k--)); do
		echo -n " "
	done

	for ((j=1;  j<=$i; j++)); do
		echo -n ". "
		
	done
	echo ""

done

for ((i=$(($1-1)); i>0; i--)); do
	for ((k=0; k<=$(($1-$i)); k++)); do
		echo -n " "
	done

	for ((j=$i; j>0; j--)); do
		echo -n ". "
	done
	echo ""
done



exit 0
