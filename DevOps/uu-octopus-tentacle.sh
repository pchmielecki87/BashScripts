#!/bin/sh
#working on ubu19
#https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1910

#add Octopus repo keys
sudo apt-key adv --fetch-keys https://apt.octopus.com/public.key
sudo add-apt-repository "deb https://apt.octopus.com/ stretch main"

#update and upgrade
sudo apt update -y && sudo apt upgrade -y

#install octopus tentacle
sudo apt install tentacle

#configure
sudo /opt/octopus/tentacle/configure-tentacle.sh
