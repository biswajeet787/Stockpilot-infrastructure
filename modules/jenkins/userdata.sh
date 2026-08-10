#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

# Update package index
apt-get update -y

# Install required packages
apt-get install -y \
    openjdk-21-jdk \
    fontconfig \
    git \
    docker.io \
    curl \
    wget \
    unzip \
    gnupg \
    ca-certificates

# Enable Docker
systemctl enable docker
systemctl start docker

# Allow ubuntu user to run Docker
usermod -aG docker ubuntu

# Install AWS CLI v2
cd /tmp

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

unzip -o awscliv2.zip

./aws/install --update

# Install Jenkins Repository
mkdir -p /etc/apt/keyrings

wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update -y

# Install Jenkins
apt-get install -y jenkins

# Enable Jenkins
systemctl enable jenkins
systemctl start jenkins

# Allow Jenkins to run Docker
usermod -aG docker jenkins

# Restart Services
systemctl restart docker
systemctl restart jenkins