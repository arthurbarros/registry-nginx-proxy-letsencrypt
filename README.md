# Docker Registry made easy

This repository aim to make deploy a docker registry easy with Let's Encrypt and simple HTTP authentication.

### Running

```bash
mkdir -p /opt/docker/
cd ~

git clone git@github.com:arthurbarros/registry-nginx-proxy-letsencrypt.git /opt/docker/registry-nginx-proxy-letsencrypt/

cd /opt/docker/registry-nginx-proxy-letsencrypt/volumes/htpasswd
htpasswd -c docker-registry.htpasswd user1
```

