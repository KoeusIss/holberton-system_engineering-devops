# fix a typos in the php setting local file
exec {'fix_phpp_typos':
  command => "sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
  path    => '/bin',
}
