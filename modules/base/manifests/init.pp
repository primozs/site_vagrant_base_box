
class base {
    
  # packages
	class { "openssh":
	  source => "puppet:///modules/base/sshd_config",	 
	}     
  class { 'git': }
  class { "nano": } 
  
  # network static should not be defined before packaging 
#  class { "network::interfaces":
#    interfaces => {
#      "eth0" => {
#        "method" => "dhcp",
#      },
#      "eth1" => {
#        "method" => "static",
#        "address" => "192.168.56.11",
#        "netmask" => "255.255.255.0",
#        "network" => "192.168.56.0",
#        "brodcast" => "192.168.56.255",
#      }
#    },
#    auto => ["eth0", "eth1"],
#  } ->
  
  class { "network::interfaces":
    interfaces => {
      "eth0" => {
        "method" => "dhcp",
      },
    },
    auto => ["eth0"],
  } ->    
  
  # hostname
  class { "hostname":
    hostname => "vagrant",
  } ->

  # hosts  
  class {"hosts": 
    host_ip => "192.168.56.11",
    host_fqdn => "vagrantup.com",
  }   
  
  # setup users
  class {"users": }
  class {"auth": }
  
  # stup grub, should not appear
  class {"grub": }
    
  # enshure not mounted, mount for guest additions should be defined before packaging   
  mount { "/mnt/cdrom":
    device => "/dev/cdrom",
    ensure => absent,
    fstype => "iso9660",
    options => "ro",
  }      

}