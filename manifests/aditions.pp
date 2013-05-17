#
# Install virtual guest additions
#
class aditions {
  
  # system update
  class {'base::update': } ->  
  
  file { "/mnt/cdrom":
    ensure => "directory",
  } -> 

  mount { "/mnt/cdrom":
    device => "/dev/cdrom",
    ensure => mounted,
    fstype => "iso9660",
    options => "ro",
  } -> 

  package { "dkms":
    ensure => present,
  } ->

  package { "xorg":
    ensure => present,
  } ->

  exec { "sh VBoxLinuxAdditions.run":
    cwd => "/mnt/cdrom",  
    path => ["/bin","/usr/bin"],
    logoutput => true,
    returns => [0,1],
  } -> 
  
  # clean
  class { "base::clean": }  
}

# init
class {"aditions": }