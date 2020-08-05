# Install nginx server
exec {'/usr/bin/env apt-get update':}
exec {'/usr/bin/env apt-get install -y nginx':}
exec {'/usr/bin/env mkdir -p /var/www/koeusiss/html':}
exec {'/usr/bin/env echo "Holberton School" > /var/www/koeusiss/html/index.html':}
exec {'/usr/bin/env echo "Ceci n\'est pas une page" > /var/www/koeusiss/html/custom_404.html':}
exec {'/usr/bin/env echo "server{
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/koeusiss/html;
    index index.html index.htm;
    server_name koeusiss.tech;
    rewrite ^/redirect_me$ http://example.com permanent;
    error_page 404 /custom_404.html;
}" > /etc/nginx/sites-available/koeusiss.tech':}
exec {'/usr/bin/env sudo rm /etc/nginx/sites-enabled/default':}
exec {'/usr/bin/env sudo ln -s /etc/nginx/sites-available/koeusiss.tech /etc/nginx/sites-enabled/':}
exec {'/usr/bin/env sudo service nginx restart':}
