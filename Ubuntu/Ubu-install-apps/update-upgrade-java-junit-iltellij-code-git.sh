#!/bin/sh
#working on ubu18+

#update and upgrade
sudo apt update -y && sudo apt upgrade -y

#install snap store
sudo apt install snapd -y

#java (open)

    #add ppa
    sudo add-apt-repository ppa:linuxuprising/java

        #java 8
        sudo apt install -y openjdk-11-jre #-headless #JRE > /usr/lib/jvm/java-11-openjdk-adm64
        sudo apt install -y openjdk-11-jdk #-headless #JDK > /usr/bin/java

        #java 11
        sudo apt install -y openjdk-11-jre #-headless #JRE > /usr/lib/jvm/java-11-openjdk-adm64
        sudo apt install -y openjdk-11-jdk #-headless #JDK > /usr/bin/java

        #default
        sudo apt install -y default-jdk

    #check java version
    echo "Check Java version"
    java -version

#junit
sudo apt install junit4 -y

#intellij-latest
sudo snap install --classic intellij-idea-community

#vscode-latest
sudo snap install --classic code # or code-insiders

#git
sudo apt install -y git

