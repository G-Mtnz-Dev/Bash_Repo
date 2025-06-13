#!/bin/bash

suma () {
sum=$(($1+$2))
return $sum
}

read -p "Ingresa un número: " int1
read -p "Ingresa un número: " int2

result=$(suma $int1 $int2)
echo "El resultado es : $result"