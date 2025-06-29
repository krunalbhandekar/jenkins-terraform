#!/bin/bash

# Update package list
sudo apt update && sudo apt upgrade -y

# Add the Adoptium GPG key
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor -o /usr/share/keyrings/adoptium-archive-keyring.gpg

# Add the repository
echo "deb [signed-by=/usr/share/keyrings/adoptium-archive-keyring.gpg] https://packages.adoptium.net/artifactory/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

# Update package list
sudo apt update

# Install Java 21
sudo apt install temurin-21-jdk -y