#!/bin/bash

# -d directorio -f archivos

read -p "Ingresa un directorio: " dir

if [ -d $dir ]; then
    echo "Listado de archivos en $dir"
    for archivo in $dir/*; do
        if [ -f $archivo ]; then
            echo "$archivo Esto es un archivo"
        elif [ -d $archivo ]; then
            echo "$archivo Esto es un directorio"
        else
            echo "$archivo Es desconocido"
        fi #Cierra el condicional
    done #Cierra el bucle for
else
    echo "Error: El directorio $dir no existe o no es valido"
fi