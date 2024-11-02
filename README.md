Primero, en nuestra computadora, instalaremos Git usando el comando sudo apt install git.

Luego, clonaremos el repositorio con el comando git clone https://github.com/zhaitho-esp/exa.git.

Después de descargar el repositorio, ingresamos a la carpeta exa y otorgamos permisos de ejecución al script install.sh con chmod +x install.sh.

Para ejecutarlo, usamos ./instalador.sh

Después, accedemos a la carpeta Proyecto para dar permisos al script ssh.sh usando los siguientes comandos: cd Proyecto y chmod +x ssh.sh.

Cuando la instancia EC2 esté en ejecución, ejecutaremos el script ./ssh.sh.

Dentro de la instancia, instalaremos Git (si no está ya instalado) con sudo apt install git.

A continuación, clonaremos el repositorio usando el comando git clone https://github.com/zhaitho-esp/exa.git.

Entramos en la carpeta exa, luego a la subcarpeta docker, y damos permisos al script install_docker.sh con chmod +x install_docker.sh.

Ejecutamos el script de instalación de Docker con ./docker_install.sh

Luego, damos permisos de ejecución al script docker.sh con chmod +x docker.sh.

Y lo ejecutamos usando ./docker_septup.sh

Para hacer pruebas, abrimos un navegador y accedemos a la dirección http://<IP_Publica_EC2>, reemplazando <IP_Publica_EC2> con la IP pública de la instancia EC2.
