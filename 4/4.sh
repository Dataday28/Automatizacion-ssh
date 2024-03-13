#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "ERROR: este script debe ejecutarse con privilegios root"
    exit 1
    
fi

if dpkg -l apache2 >/dev/null 2>&1; then
    echo "Apache instalado"
    exit 0
fi

sudo apt-get update
sudo apt-get install -y apache2

if [ $? -eq 0 ]; then 
    echo "Apache instalado"
    sudo systemctl start apache2
    sudo systemctl enable apache2
else
    echo "ERROR no se pudo instalar"
fi