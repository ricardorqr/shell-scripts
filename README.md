# Install Maven, Git, Java and Ansible 

You can create a script to automate the installation process of Maven, Git, Java and Ansible. [Here's an example](/install-java-git-maven-ansible.sh).

1. Open a text editor on your Linux system.
2. Copy and paste the following code into the text editor:

```shell
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
```

3. Save the file as `install.sh`.
4. Open the terminal on your Linux system and navigate to the directory where you saved the `install.sh` file.
5. Run the following command to make the script executable:

```shell
chmod +x install.sh
```

6. Run the script using the following command:

```shell
./install.sh
```

7. Firstly, this will update your system's package list. Secondly, install Ansible, Git, Maven and Java. Lastly, check all versions.