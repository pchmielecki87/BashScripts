#!/bin/sh
#sudo sh -x <script_name>
#based on https://dev.to/letsmeetphil/local-sonarqube-7-9-1-community-lts-on-kubernetes-38d9

#update and upgrade
sudo apt update -y && sudo apt upgrade -y

#git
sudo apt install -y git

#get yaml files from github
mkdir git-repo && cd ./git-repo
#wget https://raw.githubusercontent.com/username/reponame/path/to/file
git clone git@github.com:pchmielecki87/PC.Kubernetes.Dev.git
cd ./PC.Kubernetes.Dev/

#secret
kubectl create secret generic postgres-pwd --from-literal=password=PASSWORD

#run deployments
kubectl create -f ./RabbitMQ/rabbitmq-namespace.json
kubectl create -f ./RabbitMQ/rabbitmq-simple-nonpersistent --namespace=rabbitmq-dev
