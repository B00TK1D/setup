# Server Setup Quickstart

* Save git credentials
  * ```bash
    git config --global credential.helper store
    ```
* Install generally useful server utils:
  * ```bash
    sudo apt update && apt install -y zip gzip iputils-ping traceroute htop tmux neovim tcpdump
    ```
* Install docker
  * ```bash
    curl -fsSL https://get.docker.com | sh
    ```
* Install golang
  * ```bash
    curl -fsSLo- https://s.id/golang-linux | bash
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
    
        # Require basic authentication for all requests
        auth_basic "Restricted Area";
        auth_basic_user_file /etc/nginx/.htpasswd;

        # Proxy requests
        location / {
            proxy_set_header Host $host;
            proxy_pass http://127.0.0.1:3434;
            proxy_redirect off;
        }
    }
    server {
        listen 80;
        server_name subdomain2.domain.com;
        
        # Require basic authentication for all requests
        auth_basic "Restricted Area";
        auth_basic_user_file /etc/nginx/.htpasswd;

        # Proxy requests
        location / {
            proxy_set_header Host $host;
            proxy_pass http://127.0.0.1:3435;
            proxy_redirect off;
        }
    }
    ...
    ```
  3. ```bash
     htpasswd -c /etc/nginx/.htpasswd admin
     sudo certbot --nginx -d subdomain1.domain.com -d subdomain2.domain.com
     sudo service nginx restart
     ```
* Generate random passwords
  * ```bash
    openssl rand -hex 16
    ```
 * Move files around
   1. Compress files
   ```bash
   tar -czvf files.tar.gz /path/src
   ```
   2. SCP files between hosts
   ```bash
   scp /local/dst user@remote:/src
   ```
   3. Decompress files
   ```bash
   tar -xvzf files.tar.gz -C /local/dst
   ```
