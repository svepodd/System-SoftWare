#/bin/bash

#code

for i in $1; do
	array+=($i)
done

for ((j=0; j<${#array[@]}; j++)); do
	while read -n 1 char; do
		ArrChar+=($char)        #array of char
	done <<< "${array[$j]}"
done


for ((i=0; i<${#ArrChar[@]}; i++)); do
	bin=$(echo "obase=2;${ArrChar[$i]}" | bc)       #decimal to binary
	k=${#bin} #number of bits in char
	for ((j=0; j<$(($k-1)); j++)); do
		num="0"                 #writing 0 (k-1) times
	done
	num="$num""1"                   #after 0 always 1
	num="$num""$bin"                #after 0....1 always initial number
	Result+=($num)                  #unite our code numbers in array Result
	unset num
done

for ((i=0; i<${#Result[@]}; i++)); do
	echo -n ${Result[$i]}
done
echo

unset ArrChar

#this was code, after will decode

for i in $2; do
        Array+=($i)
done

for ((j=0; j<${#Array[@]}; j++)); do
	while read -n 1 char; do
		ArrChar+=($char)    #Array of char
	done <<< "${Array[$j]}"
done

pos=0
for ((i=0; i<${#ArrChar[@]}; )); do
	
	length=1                    #minimal length is 1

	while ((${ArrChar[$i]}!="1")); do
		length=$(($length+1))  #determine length with first 1
		i=$(($i+1))
	done

	i=$(($i+1))
	
	for ((j=$length; j<$((2*$length)); j++)); do
		num="$num""${ArrChar[$i]}"  #determine binary namber that we use in decode number
		i=$(($i+1))
	done		
       	
	ArrBinNum+=($num) #create array of binary numbers that we will use in decode number

	unset num
	unset length

done

for ((i=0;i<${#ArrBinNum[@]};i++)); do
	dec=$(echo "ibase=2;${ArrBinNum[$i]}" | bc) #binary in decimal
	ArrDecNum+=($dec)  #create array of decimal nambers that using in decode result
	unset dec
done


for ((j=0;j<${#ArrDecNum[@]};j++)); do
	echo -n ${ArrDecNum[$j]}
done

echo

exit 0
