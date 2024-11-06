#!/bin/bash

# Comprobamos si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script necesita permisos de superusuario. Por favor, ejecútalo con 'sudo'."
    exit 1
fi

# Mensaje de inicio
echo "Iniciando la instalación de Docker Desktop y dependencias..."

# Actualizamos el índice de paquetes
echo "Actualizando los repositorios de paquetes..."
apt-get update -y || { echo "Error al actualizar los repositorios. Abortando."; exit 1; }

# Instalamos GNOME Terminal si no está instalado
echo "Verificando si gnome-terminal está instalado..."
if ! dpkg -l | grep -q "gnome-terminal"; then
    echo "Instalando gnome-terminal..."
    apt install gnome-terminal -y || { echo "Error al instalar gnome-terminal. Abortando."; exit 1; }
else
    echo "gnome-terminal ya está instalado."
fi

# Instalamos Docker Desktop
echo "Instalando Docker Desktop desde el archivo ./docker-desktop-amd64.deb..."
if [ -f "./docker-desktop-amd64.deb" ]; then
    apt-get install ./docker-desktop-amd64.deb -y || { echo "Error al instalar Docker Desktop. Abortando."; exit 1; }
else
    echo "No se encontró el archivo ./docker-desktop-amd64.deb. Asegúrate de que el archivo esté en el directorio actual."
    exit 1
fi

# Mensaje de éxito
echo "Docker Desktop y dependencias instalados con éxito."
