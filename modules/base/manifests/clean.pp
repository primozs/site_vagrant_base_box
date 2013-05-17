
class base::clean {
  # clean
  exec {'clean':
    command => 'apt-get clean',
    path	=> '/bin:/usr/bin:/sbin:/usr/sbin',
  }    
}