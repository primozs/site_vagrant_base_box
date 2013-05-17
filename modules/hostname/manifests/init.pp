
class hostname($hostname){
  
  file {'/etc/hostname':
    ensure => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',    
    content => template('hostname/hostname.erb'),
    notify  => Exec['hostname-start'],    
  }
  
  exec { 'hostname-start':
    command     => '/etc/init.d/hostname start',
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
    refreshonly => true,
  }
  
}