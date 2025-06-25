#!/bin/bash

# Update package list
sudo apt update && sudo apt upgrade -y

# Install Java 21
sudo apt install temurin-21-jdk -y