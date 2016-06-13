# Docker Registry made easy

This repository aim to make deploy a docker registry easy with Let's Encrypt and simple HTTP authentication.

### Running

```bash
#Docker Registry data directory
mkdir -p /opt/docker/registry-data/lib/registry

#This project
git clone git@github.com:arthurbarros/registry-nginx-proxy-letsencrypt.git /opt/docker/registry-nginx-proxy-letsencrypt/

#direcotry where registry users will be stored
cd /opt/docker/registry-nginx-proxy-letsencrypt/volumes/htpasswd
htpasswd -c `your_own_domain.com` `user_name`

cd /opt/docker/registry-nginx-proxy-letsencrypt/
sh run.sh my_awesome_domain_name.com my_valid@email_address.com

docker-compose up -d
```



