#!/bin/bash
apt install --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt-get install --yes docker-ce nginx

systemctl stop nginx

rm /etc/nginx/sites-enabled/default

# Create new Nginx config file
tee /etc/nginx/sites-available/myapp.conf > /dev/null <<EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://172.17.0.2:80;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

# Enable new Nginx config
ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/

# Test Nginx configuration
nginx -t

# Start Nginx
systemctl start nginx
