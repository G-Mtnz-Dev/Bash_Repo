
#!/bin/bash
sampleFunction () {
mkdir -p $1
cd $1
}
sampleFunction myDir

#La función leerá el primer argumento y creará un directorio con ese nombre. 
#Después de ejecutar el script, comprueba la ruta de trabajo actual
#utilizando el comando pwd en el terminal. 
#verás que actualmente estás dentro del recién creado myDir.