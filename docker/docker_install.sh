#!/bin/bash

# Actualiza la lista de paquetes disponibles
echo "Iniciando la actualización del sistema..."
sudo apt update -y

# Elimina cualquier versión antigua de Docker
echo "Eliminando versiones previas de Docker..."
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove -y $pkg
done

# Instala paquetes necesarios para la configuración de Docker
echo "Instalando dependencias para Docker..."
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Añade el repositorio oficial de Docker a las fuentes de APT
echo "Añadiendo el repositorio de Docker a las fuentes de APT..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Instala Docker y sus componentes
echo "Instalando Docker y los paquetes asociados..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Comprueba el estado del servicio de Docker
echo "Comprobando el estado de Docker..."
sudo systemctl status docker

# Inicia el servicio de Docker si no está activo
echo "Iniciando Docker..."
sudo service docker start

# Añade el usuario actual al grupo de Docker para evitar el uso de 'sudo'
echo "Añadiendo el usuario al grupo 'docker' para facilitar el uso de comandos Docker..."
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Instalación de Docker completada. Docker se está ejecutando correctamente."
echo "Para usar Docker sin 'sudo', cierra y vuelve a abrir la terminal o ejecuta 'newgrp docker'."


