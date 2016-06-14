#!/usr/bin/env bash

NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
mv /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/domain_name /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/"$1"
sed -i -e "s/{{domain_name}}/$1/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/"$1"
sed -i -e "s/{{domain_name}}/$1/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/registry/config/config.yml
sed -i -e "s/{{http_secret}}/$NEW_UUID/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/registry/config/config.yml
sed -i -e "s/{{domain_name}}/$1/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/docker-registry.conf
sed -i -e "s/{{domain_name}}/$1/g" /opt/docker/registry-nginx-proxy-letsencrypt/docker-compose.yml
sed -i -e "s/{{letsencrypt_email}}/$2/g" /opt/docker/registry-nginx-proxy-letsencrypt/docker-compose.yml

echo "done"