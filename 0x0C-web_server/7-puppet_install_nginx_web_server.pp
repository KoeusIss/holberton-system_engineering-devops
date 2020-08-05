# Install nginx server
exec {'apt-get update && apt-get install -y nginx':
    path => '/usr/bin'
}
exec {'echo "Holberton School" > /var/www/html/index.nginx-debian.html':
    path => '/bin'
}
exec {'service nginx restart':
    path => '/usr/sbin'
}
