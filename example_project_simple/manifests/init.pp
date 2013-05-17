package { "apache2":
  ensure  => present,
}

service { "apache2":
  ensure  => "running",
  require => Package["apache2"],
}

file { "/var/www/sample-webapp":
  ensure  => "link",
  target  => "/vagrant/sample-webapp",
  require => Package["apache2"],
  notify  => Service["apache2"],
}