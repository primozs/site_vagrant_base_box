
class grub {
  
  exec { 'update-grub':
    command     => 'update-grub',
    path => ["/bin","/usr/bin"],
    refreshonly => true,
  }
  
  file { '/etc/default/grub':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => 'puppet:///modules/grub/etc/default/grub',
    notify  => Exec['update-grub'],
  }
  
}