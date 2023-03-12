#!/bin/bash

# Update package list
sudo yum upgrade -y

# Install Java 11
sudo amazon-linux-extras install java-openjdk11 -y

# Install Maven
sudo yum install maven -y

# Install Git
sudo yum install git -y

# Install Ansible
sudo amazon-linux-extras install ansible2 -y

# Install Terraform
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform -y

# Install AWSCLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -LO https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl)/bin/linux/amd64/kubectl"
sudo curl -LO "https://dl.k8s.io/$(curl -LO https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install EKSCTL
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Update package list
sudo yum upgrade -y

echo "=============== Ansible ==============="
ansible --version

echo "=============== Maven ==============="
mvn --version

echo "=============== Git ==============="
git --version

echo "=============== Java ==============="
java --version

echo "=============== Terraform ==============="
terraform --version

echo "=============== AWSCLI ==============="
aws --version

echo "=============== Kubectl ==============="
kubectl version --client

echo "=============== EKSCTL ==============="
eksctl version