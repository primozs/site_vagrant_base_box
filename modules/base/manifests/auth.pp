
class auth {
	
	# create dir .ssh
	file { "/home/vagrant/.ssh":
		ensure => "directory",
		mode => 755,
		owner => vagrant,
		group => vagrant,
	} ->
	
	file { "/home/vagrant/.ssh/authorized_keys":
	  mode => 644,
	  owner => vagrant,
	  group => vagrant,
	  source => "puppet:///modules/base/vagrant.pub"
	}
   	
}