#!/bin/sh
#working on ubu18+

#update and upgrade
sudo apt update -y && sudo apt upgrade -y

#java (open)

    #add ppa
    sudo add-apt-repository ppa:linuxuprising/java

    #java 11
    sudo apt install -y openjdk-11-jre #-headless #JRE > /usr/lib/jvm/java-11-openjdk-adm64
    sudo apt install -y openjdk-11-jdk #-headless #JDK > /usr/bin/java

#jenkins

    #download and install
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt install jenkins -y

    #adjust firewall
    sudo ufw allow 8080

    #restart service
    service jenkins status
    service jenkins restart

    #get initial admin pass
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword