#!/bin/bash

if [ "$(id -u) -ne 0" ]; then
    echo "El script debe ser ejecutado como root"
    exit 1
    
fi

paquetes=("apache2" "git")

for paquete in ${paquetes[@]}; do
    if ! dpkg -l $paquete > /dev/null 2>&1 then
        apt-get update
        apt-get install -y $paquete
    else
        echo " "$paquete" ya esta instalado"
    fi
done

repo="/var/www/html/startbootstrap"

if [ ! -d $repo ]; then
    git clone https://  $repo