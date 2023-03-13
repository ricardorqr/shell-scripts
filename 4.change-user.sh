#!/bin/bash

# Update package list
sudo yum upgrade -y

# Add Jenkins user in the file sudoers
sudo vi cat /etc/sudoers
jenkins  	ALL=(ALL)	NOPASSWD: ALL

# Create AWS credential to ec2-user user
aws configure

# Check the user
aws sts get-caller-identity

# Update the Kube context
aws --region us-east-2 eks update-kubeconfig --name test-eks --kubeconfig ~/.kube/config

# Get the context
cat .kube/config

# Change jenkins user to bash
sudo vi /etc/passwd
jenkins:x:995:993:Jenkins Automation Server:/var/lib/jenkins:/bin/bash

# Test login with jenkins user
sudo su - jenkins
# It should change to
-bash-4.2$

# Copy all user initialize files to jenkins user
cd /etc/skel/
# It should be e files
ls -la
-rw-r--r--  1 root root   18 Jul 15  2020 .bash_logout
-rw-r--r--  1 root root  193 Jul 15  2020 .bash_profile
-rw-r--r--  1 root root  231 Jul 15  2020 .bashrc
sudo cp .* /var/lib/jenkins/

# Test login with jenkins user
sudo su - jenkins
# It should change to
[jenkins@ip-10-0-0-246 ~]$

# Create AWS credential to jenkins user
aws configure

# Check the user
aws sts get-caller-identity

# Update the Kube context
aws --region us-east-2 eks update-kubeconfig --name test-eks --kubeconfig ~/.kube/config

# Get the context
cd ~
cat .kube/config
# Copy to Jenkins in the browser

# Reboot the server
sudo reboot


# Reference
# https://www.youtube.com/watch?v=nvYudLj0kDU&t=631s