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

#teamcity-server 2020.1

    #download and install
    wget https://download.jetbrains.com/teamcity/TeamCity-2020.1.tar.gz  # Just update to the latest version available
    tar -xzf TeamCity-2020.1.tar.gz 

    #adjust firewall
    sudo ufw allow 8111

    #start service
    ./TeamCity/bin/runAll.sh start

#nginx

    #install
    sudo apt-get install nginx -y

    #config
    sudo vim /etc/nginx/sites-available/teamcity

cat > /etc/nginx/sites-available/teamcity << EOF
server {

    listen       80;
    server_name _;

    proxy_read_timeout     1200;
    proxy_connect_timeout  240;
    client_max_body_size   0;

    location / {

        proxy_pass          http://localhost:8111/;
        proxy_http_version  1.1;
        proxy_set_header    X-Forwarded-For $remote_addr;
        proxy_set_header    Host $server_name:$server_port;
        proxy_set_header    Upgrade $http_upgrade;

    }
}
EOF

    #create a symlink to the sites-enabled folder
    sudo ln -s /etc/nginx/sites-available/teamcity /etc/nginx/sites-enabled/teamcity

    #remove default sites
    sudo rm -rf /etc/nginx/sites-available/default
    sudo rm -rf /etc/nginx/sites-enabled/default

    #restart nginx
    sudo service nginx restart
