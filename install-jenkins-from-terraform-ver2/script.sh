#!/bin/bash

#Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo add-apt-repository universe
sudo apt-get install jenkins -y
sudo apt-get update
sudo apt-get install openjdk-11-jdk -y

echo "Password to Jenkins "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
