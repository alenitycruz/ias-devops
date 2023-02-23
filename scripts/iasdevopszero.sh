#!/bin/bash

echo "Atualizando o servidor..."

apt-get update
apt-get upgrade

echo "Criando um container MySQL..."

cd var/lib/docker/volumes
mkdir data
mkdir app
chmod 777 /data
cd data
mkdir meuBanco
cd /
cd var/lib/docker/volumes
cd app
mkdir _data
chmod 777 /_data
cd _data
touch index.php
docker run --name web-server -dt -p 80:80 -mount type=volume.src=app.dst=/app/ webdevops/php-apache:alpine-php7

echo "Iniciando um cluster Swam..."

docker swarm init
docker node ls