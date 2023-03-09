#!/bin/bash

# Update package list
sudo yum update -y

# Install Maven, Git, and Java 11
sudo yum install maven git java-11-openjdk-devel -y

# Install Ansible
sudo amazon-linux-extras install ansible2 -y

# Install Terraform
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Update package list
sudo yum update -y

# Check Ansible version
echo "== Ansible ==============="
ansible --version

# Check Maven version
echo "== Maven ==============="
mvn --version

# Check Git version
echo "== Git ==============="
git --version

# Check Java version
echo "== Java ==============="
java --version

# Check Terraform version
echo "== Terraform ==============="
terraform --version