#!/bin/bash

# Comprobamos si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script necesita permisos de superusuario. Por favor, ejecútalo con 'sudo'."
    exit 1
fi

docker version