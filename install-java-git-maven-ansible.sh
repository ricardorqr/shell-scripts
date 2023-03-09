#!/bin/bash

# Update package list
sudo yum update -y

# Install Maven, Git, and Java 11
sudo yum install ansible maven git java-11-openjdk-devel -y

# Install Ansible
sudo amazon-linux-extras install ansible2 -y

# Check Ansible version
ansible --version

# Check Maven version
mvn -version

# Check Git version
git --version

# Check Java version
java -version

# Update package list
sudo yum update -y