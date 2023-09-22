# Server Setup Quickstart

* Save git credentials
  * ```bash
    git config --global credential.helper store
    ```
* Install generally useful server utils:
 * ```bash
   sudo apt update && apt install -y docker docker-compose zip gzip iputils-ping traceroute htop
   ```
* Set up subdomains with SSL:
  1. Install nginx and certbot
    ```bash
    sudo apt install -y nginx certbot python3-certbot-nginx
    ```
  2. Set `/etc/nginx/sites-enabled/default` to:
    ```nginx
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
  3. ```bash
     sudo certbot --nginx -d subdomain1.domain.com -d subdomain2.domain.com
     sudo sevice nginx restart
     ```
* Generate random passwords
  * ```bash
    openssl rand -hex 16
    ```
