#!/bin/bash

# install jenkins
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# then install git
sudo yum install git -y

#then install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#finally install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

#add swap memory to aviod oom error
sudo fallocate -l 1G /swapfile

# If fallocate is not available, use dd
# sudo dd if=/dev/zero of=/swapfile bs=1M count=1024

# Set the correct permissions
sudo chmod 600 /swapfile
# Set up the swap space
sudo mkswap /swapfile
# Enable the swap file
sudo swapon /swapfile
# Verify the swap space
sudo swapon --show
free -h
# Make the swap file permanent
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab