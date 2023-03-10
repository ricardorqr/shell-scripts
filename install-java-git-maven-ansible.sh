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

# Install AWSCLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
#[kubernetes]
#name=Kubernetes
#baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
#enabled=1
#gpgcheck=1
#gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
#EOF
#sudo yum install -y kubectl

# Install EKSCTL
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Update package list
sudo yum update -y

# Check Ansible version
echo "=============== Ansible ==============="
ansible --version

# Check Maven version
echo "=============== Maven ==============="
mvn --version

# Check Git version
echo "=============== Git ==============="
git --version

# Check Java version
echo "=============== Java ==============="
java --version

# Check Terraform version
echo "=============== Terraform ==============="
terraform --version

# Check AWSCLI version
echo "=============== AWS CLI ==============="
aws --version

# Check Kubectl version
echo "=============== Kubectl ==============="
kubectl version --client

# Check EKSCTL version
echo "=============== EKSCTL ==============="
eksctl version
