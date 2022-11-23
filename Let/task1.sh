#/bin/bash

read -ra array <<< $1  #чтение в массив 
lenght=${#array[@]}

for ((i=$(($lenght-1)); i>=0;i--)); do
	echo -n "${array[$i]} "
done

echo

exit 0
