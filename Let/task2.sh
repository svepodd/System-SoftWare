#/bin/bash

if [ -n "$1" ]; then #если входные параметры есть

#$* массив всех входных данных
for tmp in $*; do
	array+=($tmp)
done

num=$(printf "%d\n" "'a")

for ((i=0; i<${#array[@]}; i++)); do
	num=$(printf "%d\n" "'${array[$i]}") #получаем номер буквы по таблице ascii
	sum=$(($sum+$num)) #сумма номеров по таблице ascii всех элементов массива
done

resultnum=$(($(($sum%96))+96)) #находим число получившейся буквы в таблице ascii


#проверка переполнения
if (($resultnum>122)); then  
	printf "\x$(printf %x $(($resultnum-26)))"
else
	printf "\x$(printf %x $resultnum)" #получем букву по номеру по таблице ascii
fi
echo

else #если входных параметров нет 
	echo "z"
fi

exit 0
