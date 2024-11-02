#!/bin/bash

# Asigna nombres por defecto, pero permite cambios desde la línea de comandos
IMAGE_NAME="${1:-examen3}"  # Nombre de la imagen, puede ser especificado al ejecutar el script
CONTAINER_NAME="${2:-pagina_web}"  # Nombre del contenedor, puede ser especificado al ejecutar el script

# Construcción de la imagen a partir del Dockerfile en el directorio actual
echo "Iniciando la construcción de la imagen '$IMAGE_NAME'..."
if docker build -t "$IMAGE_NAME" .; then
    echo "La imagen '$IMAGE_NAME' se ha creado exitosamente."
else
    echo "Error: No se pudo construir la imagen." >&2
    exit 1
fi

# Lanzamiento del contenedor basado en la imagen recién creada
echo "Iniciando el contenedor '$CONTAINER_NAME'..."
if docker run -d --name "$CONTAINER_NAME" -p 80:80 "$IMAGE_NAME"; then
    echo "El contenedor '$CONTAINER_NAME' se está ejecutando en segundo plano."
else
    echo "Error: No se pudo iniciar el contenedor." >&2
    exit 1
fi

# Mensaje de confirmación final
echo "Todo listo. Accede a tu aplicación web en http://localhost"


