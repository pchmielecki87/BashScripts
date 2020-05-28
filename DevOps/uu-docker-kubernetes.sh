#!/bin/sh
#working on ubu16+ (for Ubu 16 convert apt to apt-get)
#based on docker docs > https://docs.docker.com/engine/install/ubuntu/
#based on kubernetes docs > https://kubernetes.io/docs/tasks/tools/install-kubectl/ 
#based on microk8s on ubuntu docs > https://ubuntu.com/kubernetes/install/

#update and upgrade
sudo apt update -y && sudo apt upgrade -y

##docker

    #remove old version
    sudo apt-get remove docker docker-engine docker.io containerd runc -y

    #install prerequisites
    sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

    #add gpg key and verify fingerprint
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88

    #get docker
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    #install docker
    sudo apt update -y
    sudo apt install docker-ce docker-ce-cli containerd.io -y

    #enable docker to launch at boot
    sudo systemctl enable docker

##kubernetes 

    #(optional) install snap store
    sudo apt install snapd -y

    #install components
    snap install kubectl --classic              #Command line client for controlling a Kubernetes cluster
    sudo snap install kubelet --classic         #Kubernetes “node agent” that runs on each node in Kubernetes
    sudo snap install kube-proxy --classic      #Kubernetes network proxy that runs on each node
    sudo snap install kube-apiserver            #Kubernetes master component that exposes the Kubernetes API
    sudo snap install kube-controller-manager   #Kubernetes master component that runs controllers
    sudo snap install kube-scheduler            #Kubernetes master component that assigns each newly created pod to a node
    sudo snap install kubeadm --classic         #Tool for bootstrapping Kubernetes clusters
    sudo snap install kubefed --classic         #Kubernetes cluster federation manager
    sudo snap install helm --classic            #Kubernetes package manager

##(optional) microk8s

    #MicroK8s is a small, fast, secure, single node Kubernetes that installs on just about any Linux box. 
    #Use it for offline development, prototyping, testing, or use it on a VM as a small, cheap, reliable k8s for CI/CD. 
    #It's also a great k8s for appliances - develop your IoT apps for k8s and deploy them to MicroK8s on your boxes.

    #install
    #sudo snap install microk8s --classic

    #create an alias 
    #snap alias microk8s.kubectl kubectl
