#!/bin/bash

# Garantir que erros parem a execução
set -e

# Parar e remover o container se existir
sudo docker rm -f ContainerJava || true

# Remover imagem antiga
sudo docker rmi imagem-java:v1 || true

# Entrar no projeto onde está o Git
cd /home/ubuntu/RouteFinder_JavaApplication
git pull

# Rodar clean e package se necessário
cd /home/ubuntu/RouteFinder_JavaApplication/leitura_arquivos_projeto
mvn clean package

# Mover o JAR gerado (ajuste o nome conforme necessário)
cd /home/ubuntu/RouteFinder_JavaApplication/leitura_arquivos_projeto/target
mv leitura_arquivos_projeto-1.0-SNAPSHOT-jar-with-dependencies.jar /home/ubuntu/

# Construir imagem e rodar container
cd
sudo docker build -f Dockerfile-Java -t imagem-java:v1 .
sudo docker run -d --name ContainerJava --network ubuntu_rede-ec2 imagem-java:v1