#!/bin/bash

# Actualiza el sistema
sudo apt update -y

# Descargar e instalar AWS CLI
sudo apt install curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Descargar e instalar Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform

# Configura AWS CLI automáticamente
aws configure set aws_access_key_id "ASIAQ3EGP4IVWMHLZT23"
aws configure set aws_secret_access_key "tmhjUEonBBCe1kAJqjTL9VLtHcF+sDhjfx50Rcp1"
aws configure set region "us-east-1"
aws configure set output "json"

# Reemplaza el archivo de credenciales
CREDENTIALS_FILE="$HOME/.aws/credentials"
echo "[default]" > $CREDENTIALS_FILE
echo "aws_access_key_id=ASIAQ3EGP4IVWMHLZT23" >> $CREDENTIALS_FILE
echo "aws_secret_access_key=tmhjUEonBBCe1kAJqjTL9VLtHcF+sDhjfx50Rcp1" >> $CREDENTIALS_FILE
echo "aws_session_token=IQoJb3JpZ2luX2VjEDgaCXVzLXdlc3QtMiJGMEQCIH7A8fG3kXxsGgSj6YtCB/okGHbjZ6FwH4600h1Rsj9YAiBlwXPbzDWisIr0QXh9dZFgfFxb9ERCOITA/+H5HF/LbSq/Agix//////////8BEAAaDDA1ODI2NDExNzgwMyIMhz4vvtt58tdU75DmKpMCC9mpBHwOfeKi9mq6Q1EG80WJNkZo9czlhBCAfaxHz0dLmb8qWcqCubFh3Q2BCH+TOLaZ1CBIYGlazxcdTujrmiISyWI8sjzjrtvUNM7ZT3XmHCjZ43MRnBo/frxIy5Ws2xyZC+GqSjrTpXyIdqVnqHF8YRARjmphdgaczmDYa6R3MDjV7SSC6MALCWgP8+FeKvgTSROOxRwP/brx/NeqoRcZZRsJ4SNi8pd40/XrbgQDsDhBHG5muJenAxllyJz7UT8vNL24McguHf8MGW5rQ6+McBq/VJEccYZ1j2xeT4MRonTkWe/zkaiNw7gDzDwFXCQAClPA79cKHM27yNM4dYPDIh1ScuR1XMUcBtW7zGWKvdAwyNCVuQY6ngHvFnbipuqLw0jbe1S+cFl+84FmRXi6Thqh6HPmSrEqtKvhnrHajb3WykLwPeGU4XabLBOWs2eK+OCTunM1P+zg1lnZ2aZCdVgSXMZ8tBXPTx0BhbkAMqKQT/mAToYme1VGIhZ3GjU0u+RgxkOsUeyQbfpwfoIUJrNI8vMT9Atslp+cDNs0aLEa5Twybkc0NDU6TGLJlsE1bL2mEFO8kg==" >> $CREDENTIALS_FILE

#Iniciar el terraform
cd examenfinal
cd instancia
terraform init
terraform plan
terraform apply -auto-approve



