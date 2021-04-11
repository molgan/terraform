#!/bin/bash

#Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install openjdk-11-jdk -y
sudo apt-get update
sudo add-apt-repository universe
sudo apt-get install jenkins -y

echo "Password to Jenkins "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
