#!/bin/bash

# Ensure that your software packages are up to date on your instance by using the following command to perform a quick software update:
sudo yum upgrade -y

# Add the Jenkins repo using the following command:
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package:
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y

# Install Jenkins:
sudo yum install jenkins -y

# Add permissions
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
newgrp docker

# Update
sudo yum upgrade -y

# Enable the Jenkins service to start at boot:
sudo systemctl enable jenkins

# Start Jenkins as a service:
sudo systemctl start jenkins

# You can check the status of the Jenkins service using the command:
sudo systemctl status jenkins

# Use the following command to display this password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

grep docker /etc/group
