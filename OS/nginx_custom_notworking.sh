#!/bin/sh
#based on: https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/
#https://aaronluna.dev/blog/install-nginx-source-code-shell-script/

#decide which version of nginx and additional headers module is needed
NGINX_VERSION=1.18.0
MORE_SET_HEADER_VERSION=0.33

#download perequisites
sudo apt install -y gcc libc-dev make zlib1g-dev libpcre3-dev

#download and unpack nginx-extras module
cd /tmp/ \
&& curl -fSL https://github.com/openresty/headers-more-nginx-module/archive/v$MORE_SET_HEADER_VERSION.tar.gz -o $MORE_SET_HEADER_VERSION.tar.gz \
&& tar xvf $MORE_SET_HEADER_VERSION.tar.gz 

#download latest stable
wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -o nginx-$NGINX_VERSION.tar.gz \
&& tar zxf nginx-$NGINX_VERSION.tar.gz 
cd nginx-$NGINX_VERSION
echo "you are in: " && pwd

#configure build options
sudo ./configure
--sbin-path=/usr/sbin/nginx \
--modules-path=/usr/lib/nginx/modules \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-http_auth_request_module \
--with-http_xslt_module=dynamic \
--with-http_image_filter_module=dynamic \
--with-http_geoip_module=dynamic \
--with-http_perl_module=dynamic \
--with-threads \
--with-stream \
--with-stream_ssl_module \
--with-stream_ssl_preread_module \
--with-stream_realip_module \
--with-stream_geoip_module=dynamic \
--with-http_slice_module \
--with-mail \
--with-mail_ssl_module \
--with-compat \
--with-file-aio \
--with-http_v2_module \
--add-module=/tmp/headers-more-nginx-module-$MORE_SET_HEADER_VERSION

#install
sudo make
sudo make install

#start
#sudo nginx

#edit nginx.conf and copy it to new location
#sudo cp nginx.conf /etc/nginx/nginx.conf


