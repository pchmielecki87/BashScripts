#!/bin/sh
#sudo sh -x <script_name>
#working on ubu19
#https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1910

#add M$ repo keys
wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

#update and upgrade
sudo apt update -y && sudo apt upgrade -y

#install .NET Core 3.1 SDK
sudo apt install apt-transport-https -y
sudo apt install dotnet-sdk-3.1 -y

#install ASP.NET Core 3.1 Runtime
sudo apt install aspnetcore-runtime-3.1 -y

#install .NET Core 3.1 Runtime
sudo apt install dotnet-runtime-3.1 -y

