#!/bin/bash

# Update package list
sudo yum update -y

# Import GPG key and add Adoptium repo
sudo rpm --import https://packages.adoptium.net/artifactory/api/gpg/key/public

cat <<EOF | sudo tee /etc/yum.repos.d/adoptium.repo
[Adoptium]
name=Adoptium
baseurl=https://packages.adoptium.net/artifactory/rpm/amazonlinux/2/\$(uname -m)
enabled=1
gpgcheck=1
gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public
EOF

# Install Java 21
sudo yum install temurin-21-jdk -y

# Add Jenkins Repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo yum install jenkins -y

# Start and Enable Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins