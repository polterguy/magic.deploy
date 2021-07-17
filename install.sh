#!/bin/bash

clear

echo "================================================================================"
echo "Automatic installation script for Magic Cloud."
echo "Please let it finish, without interruptions, which might take some time."
echo "================================================================================"
echo ""

# Installing Docker.
sudo apt-get docker unzip ufw

# Starting docker-compose
docker-compose up -d

# Turning on firewall for everything except SSH, HTTP and HTTPS
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw enable
