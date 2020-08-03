# Install puppet-lint
exec { 'apt-get install -y ruby':
    path => "/usr/bin"
}
exec { 'gem install puppet-lint -v 2.1.1':
    path => "/usr/bin"
}
