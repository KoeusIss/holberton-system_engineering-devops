# Install a new brand ubuntu server with custom http header
exec {'/usr/bin/env apt-get update':}
package {'install_nginx':
    ensure   => installed,
    name     => nginx,
    provider => apt,
}
file {[
        '/var/www/koeusiss',
        '/var/www/koeusiss/html'
    ]:
    ensure => 'directory'
}
file {'/var/www/koeusiss/html/index.html':
    ensure  => 'present',
    content => 'Holberton School'
}
file {'/var/www/koeusiss/html/custom_404.html':
    ensure  => 'present',
    content => "Ceci n'est pas une page"
}
tidy {'/etc/nginx/sites-available/':
    recurse => true
}
tidy {'/etc/nginx/sites-enabled/':
    recurse => true
}
$cnt = "server {
	listen 80;
	listen [::]:80 default_server;

	root /var/www/koeusiss/html;
	index index.html;
	
	server_name koeusiss.tech www.koeusiss.tech;
	rewrite '^/redirect_me$' http://example.com permanent;
	error_page 404 /custom_404.html;
	location / {
		add_header X-Served-By $hostname;
	}
}"
file {'/etc/nginx/sites-available/koeusiss.config':
    content => $cnt,
}
file {'/etc/nginx/sites-enabled/koeusiss.config':
    ensure => 'link',
    target => '/etc/nginx/sites-available/koeusiss.config'
}
service {'nginx':
    ensure  => 'running'
    restart => true
}
