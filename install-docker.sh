#!/bin/bash

# Update package list
sudo yum upgrade -y

# Install Docker
sudo yum install docker -y

# Initiate the service
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

# Add permissions
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
newgrp docker

# Check the permissions
grep docker /etc/group
