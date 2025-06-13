#!/bin/bash
echo "Introduce un número:" 
read a #The user input will be stored as variable a
b=50 #The value of variable b
if [$a -eq $b]
then
echo "Acertaste !!!!"
else
echo "Ohhh ése no es el Nº"
fi