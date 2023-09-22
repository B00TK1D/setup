# Server Setup Guide Quickstart

* Save git credentials: `git config --global credential.helper store`
* Install generally useful server utils: `sudo apt update && apt install -y docker docker-compose zip gzip iputils-ping traceroute htop nginx certbot python3-certbot-nginx`
* Set up subdomains with SSL:
  1. Set /etc/nginx/sites-enabled/default to:
    ```
    server {
        listen 80;
        server_name subdomain1.domain.com;
        location / {
            proxy_set_header Host $host;
            proxy_pass http://127.0.0.1:3434;
            proxy_redirect off;
        }
    }
    server {
        listen 80;
        server_name subdomain2.domain.com;
        location / {
            proxy_set_header Host $host;
            proxy_pass http://127.0.0.1:3435;
            proxy_redirect off;
        }
    }
    ...
    ```
  2. Run `sudo certbot --nginx -d subdomain1.domain.com -d subdomain2.domain.com && sudo sevice nginx restart`

