
class users {
  
  # users root password vagrant
  user {root:
    password => '$6$HfqejlhIVz$zUkrks9yc.T80ApukCDqzg2G9CxQdA/yvwyT81UCMZBFi2lHRD6v.BRHT.3n49vzpifwXzUwPHd0VzBtXCx0b.',  
  }

  # main account login vagrant, password vagrant
  
  # groups 
  group { "admin":
    ensure => "present",
  }
  
  group { "vagrant":
    ensure => "present",
    before=> User['vagrant'],
  }
  
  user { "vagrant":
    ensure => present,
    gid => 'admin',
    groups => ['admin', 'vagrant'],
    membership => inclusive,
    require => Group['admin'],  
  }
  
  # vagrant sudo
  class { 'sudo':
    source => 'puppet:///modules/base/sudo.conf',
    require => User['vagrant'],
  }  
}