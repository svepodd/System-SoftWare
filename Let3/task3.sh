#!/bin/bash

for j in $1; do
	Array+=($j)
done

for ((i=0;i<${#Array[@]};i++)); do
	while read -n 1 char; do
		ArrayChar+=($char)
	done <<< "${Array[$i]}"
done

IndexOfMin=0
IndexOfMax=0

for ((i=0;i<${#ArrayChar[@]};i++)); do
	if ((${ArrayChar[$i]} < ${ArrayChar[$IndexOfMin]})); then
		IndexOfMin=$i
	fi

	if ((${ArrayChar[$i]} > ${ArrayChar[$IndexOfMax]})); then
                IndexOfMax=$i
	fi

done

k=0
IndexSwap=0

# if min value k time in begin of number
if (($IndexOfMin==0)); then
	for ((i=0;i<${#ArrayChar[@]};i++)); do
		if ((${ArrayChar[$i]} == ${ArrayChar[$IndexOfMin]})); then
			k=$(($k+1))
		else break
		fi
	done

	if (($k!=0)); then
        	IndexSwap=$k

		IndexOfMin=$k
	fi

	for ((i=$k;i<${#ArrayChar[@]};i++)); do
        	 if ((${ArrayChar[$i]} <= ${ArrayChar[$IndexOfMin]})); then
                	IndexOfMin=$i
       		 fi
	done
fi


result=()
result2=()

for ((i = 0; i < ${#ArrayChar[@]}; i++)); do
    if (($i < $IndexSwap)); then
      result[$i]=${ArrayChar[$i]}
    elif (($i == $IndexSwap)); then
      result[$i]=${ArrayChar[$IndexOfMin]}
    elif (($i > $IndexSwap)); then 
      if (($i <= $IndexOfMin)); then
        result[$i]=${ArrayChar[$(($i - 1))]}
      elif (($i > $IndexOfMin)); then
        result[$i]=${ArrayChar[$i]}
      fi
    fi
 done


index2=$((${#ArrayChar[@]}-1))

for ((i = 0; i < ${#ArrayChar[@]}; i++)); do
	if (($i < $index2 )); then
      		if(( $i < $IndexOfMax )); then
        		result2[$i]=${ArrayChar[$i]}
      		elif(( $i >= $IndexOfMax )); then
       			 result2[$i]=${ArrayChar[$i + 1]}
     		 fi
    	elif(( $i == $index2 )); then
     		 result2[$i]=${ArrayChar[$IndexOfMax]}
    	else
     		 result2[$i]=${ArrayChar[$i]}
    fi
done



for ((i=0; i<${#result[@]}; i++)); do
        ResStr="$ResStr${result[$i]}"
done
res=$(($ResStr))


for ((i=0; i<${#result2[@]}; i++)); do
	ResStr2="$ResStr2${result2[$i]}"
done
res2=$(($ResStr2))

if ((res<res2)); then
	echo "[$res, $IndexOfMin, $IndexSwap]"
else
	echo "[$res2, $IndexOfMax, $index2]"
fi


exit 0

