# Install a new brand ubuntu server with custom http header
exec {'/usr/bin/env apt-get update':}
exec {'/usr/bin/env apt-get install -y nginx':}

file {'create_folder_for_the_new_site':
    path    => '/var/www/koeusiss/html',
    recurse => true,
}
file {'create_index_file':
    ensure  => 'present',
    path    => '/var/www/koeusiss/html/index.html',
    content => 'Holberton School'
}
file {'create_custom_404_file':
    ensure  => 'present',
    path    => '/var/www/koeusiss/html/custom_404.html',
    content => "Ceci n'est pas une page"
}
tidy {'clean_default_available_file':
    path    => 'etc/nginx/sites-available/',
    recurse => true
}
tidy {'clean_default_enabled_file':
    path    => '/etc/nginx/sites-enabled/',
    recurse => true
}
$cnt = "server {
    listen 80;
    listen [::]:80 default_server;
    root /var/www/koeusiss/html;
    index index.html;
    rewrite ^/redirect_me$ http://exapmle.com permanent;
    error_page 404 /custom_404.html;
    add_header X-Served-By $HOSTNAME;
}"
file {'create_available_site':
    ensure  => 'present',
    path    =>'/etc/nginx/sites-available/koeusiss.config',
    content => $cnt
}
file {'enabling_site':
    ensure  => 'link'
    path    => '/etc/nginx/sites-enabled/koeusiss.config'
    target  => '/etc/nginx/sites-available/koeusiss.config'
}
service {'nginx':
    ensure  => 'running'
}
