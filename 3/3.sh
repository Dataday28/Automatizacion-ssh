#!/bin/bash

TASK_FILE="tarea.txt"

###funciones

agregar_tarea() {
    echo -n "Ingrese la descripcion de la tarea: "
    read descripcion
    echo "Ingrese la fecha de vencimiento de la tarea (Formato DD-MM-YYYY)"
    read fecha
    tarea_id=$(date +%s)
    echo "$tarea_id | $descripcion | $fecha" >> $TASK_FILE
    echo "---------------------------------------------"
    echo "Tarea agregada con el ID $tarea_id"
    echo "---------------------------------------------"
}

listar_tarea() {
    echo "---------------------------------------------"
    echo "Tareas pendientes: "
    while IFS="|" read -r id desc fecha; do
        echo "ID: $id | Descripcion: $desc | Fecha de vencimiento: $fecha"
    done < $TASK_FILE
    echo "---------------------------------------------"
}

marcar() {
    echo "Ingrese el ID de la tarea a marcar completada: "
    read tarea_id
    sed -i "/^$tarea_id/d" "$TASK_FILE"
    echo "---------------------------------------------"
    echo "Tarea completada"
    echo "---------------------------------------------"
}

eliminar() {
    echo "Ingrese el ID de la tarea a eliminar"
    read tarea_id
    sed -i "/^$tarea_id/d" "$TASK_FILE"
    echo "---------------------------------------------"
    echo "Tarea Eliminada"
    echo "---------------------------------------------"
}

###menu principal
while true; do
    echo "Sistema de tareas"
    echo "1. Agregar Tarea"
    echo "2. Listar Tarea"
    echo "3. Marcar tarea completada"
    echo "4. Eliminar Tarea"
    echo "5. Salir del programa"
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