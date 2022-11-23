#/bin/bash

for i in $1; do
	array+=($i)
done

pos=0


for ((j=0;j<${#array[@]}; j++)); do  
	while read -n 1 char; do
        	array1+=($char) #массив из букв, содержащихся в строке
	done <<< "${array[$j]}"


	for ((k=0; k<${#array1[@]}; k++)); do
        num=$(printf "%d\n" "'${array1[$k]}") #номер символа в таблице ascii

	newchar=${array1[$k]}
        if (($num>64 && $num<91)); then #замена буквы
                resultnum=$(($num+$2))
                if (($resultnum>90)); then
			if (($(($pos%2))==0));then
                        newchar=$(printf "\x$(printf %x $(($resultnum-26)))")
			else
			newchar=$(printf "\x$(printf %x $(($resultnum-26+32)))")
			fi
		else
			if (($(($pos%2))==0));then
                        newchar=$(printf "\x$(printf %x $resultnum)")
		else
			newchar=$(printf "\x$(printf %x $(($resultnum+32)))")
			fi
                fi


        elif (($num>47 && $num<58)); then #замена числа
                newchar=$((9-$(printf "\x$(printf %x $num)")))
        fi

	pos=$(($pos+1))

	Array1="$Array1$newchar" #собираем слово из букв
        #echo -n  $newchar
	done

	ResultArray+=($Array1)

	#echo -n " "
	unset Array1 #обнуляем, чтобы записать следующее слово
	unset array1 #обнуляем, чтобы слова не объединялись в один огромный массив
	pos=$(($pos+1))
done

for ((i=$((${#ResultArray[@]}-1)); i>=0; i--)); do
	echo -n "${ResultArray[$i]} "
done

exit 0
