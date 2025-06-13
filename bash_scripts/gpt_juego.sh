#!/bin/bash

echo "Introduce un número" 
read a  # El valor ingresado se almacena en la variable a

b=50    # Se asigna 50 a la variable b

if [[ $a -eq $b ]];
    then
        echo -e "¡¡¡¡¡¡¡¡¡¡ A C E R T A S T E !!!!!!!!!!!!!!!! \n"
    else
        echo -e "OHHHHHHHH ..... ESE NÚMERO NO ES !!!!!!!!! \n"
fi
