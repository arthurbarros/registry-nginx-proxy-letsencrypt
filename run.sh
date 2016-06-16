#!/usr/bin/env bash
DOMAIN_NAME=$1
LETSENCRYPT_EMAIL=$2
HTPASS=$3
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

mv /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/domain_name /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/"$DOMAIN_NAME"
sed -i -e "s/{{domain_name}}/$DOMAIN_NAME/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/"$DOMAIN_NAME"
sed -i -e "s/{{domain_name}}/$DOMAIN_NAME/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/registry/config/config.yml
sed -i -e "s/{{http_secret}}/$NEW_UUID/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/registry/config/config.yml
sed -i -e "s/{{domain_name}}/$DOMAIN_NAME/g" /opt/docker/registry-nginx-proxy-letsencrypt/volumes/nginx-vhost.d/docker-registry.conf
sed -i -e "s/{{domain_name}}/$DOMAIN_NAME/g" /opt/docker/registry-nginx-proxy-letsencrypt/docker-compose.yml
sed -i -e "s/{{letsencrypt_email}}/$LETSENCRYPT_EMAIL/g" /opt/docker/registry-nginx-proxy-letsencrypt/docker-compose.yml

htpasswd -bc volumes/htpasswd/$DOMAIN_NAME jenkins $HTPASS

echo "done"