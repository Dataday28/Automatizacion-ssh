#!/bin/bash

TASK_FILE="tarea.txt"

###funciones

agregar_tarea() {
    echo -n "Ingrese la descripcion de la tarea"
    read descripcion
    echo "Ingrese la fecha de vencimiento de la tarea (Formato DD-MM-YYYY)"
    read fecha
    tarea_id=$(date +%s)
    echo "$tarea_id | $decripcion | $fecha" >> $TASK_FILE
    echo "Tarea agregada con el ID $tarea_id"
}

listar_tarea() {
    echo "Tareas pendientes"
    while IFS="|" read -r id descripcion fecha; do
        echo "ID: id"
        echo "Descripcion: $descripcion"
        echo "Fecha de vencimiento: $fecha"
        echo "---------------------------"
    done < $TASK_FILE
}

marcar() {
    echo "Ingrese el ID de la tarea a marcar completada: "
    read id
    sed -i "/^$id/d" $TASK_FILE
    echo "Tarea completada"
}

eliminar() {
    
}

###menu principal
while true; do
    echo "Sistema de tareas"
    echo "1. Agregar Tarea"
    echo "2. Listar Tarea"
    echo "3. Marcar tarea completada"
    echo "4. Eliminar Tarea"
    echo "5. Salir Tarea"
    echo -n "Selecciona una opcion: "
    read opcion

    case $opcion in 
        1) agregar_tarea ;;
        2) listar_tarea ;;
        3) marcar ;;
        4) eliminar ;;
        5) echo "Saliendo del programa"; exit ;;
        *) echo "Opcion invalida" 
    esac


done