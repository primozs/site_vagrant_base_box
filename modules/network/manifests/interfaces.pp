class network::interfaces($interfaces={}, $mappings={}, $auto=[]) {

  file { '/etc/network/interfaces':
    ensure => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',    
    content => template('network/interfaces.erb'),
    notify  => Exec['network-restart'],
  }

  exec { 'network-restart':
      command     => '/etc/init.d/networking restart',
      path        => '/bin:/usr/bin:/sbin:/usr/sbin',
      refreshonly => true,
  }
}
