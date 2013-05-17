# usage without master:
# include hosts
# 
# usage with master:
#  class {"hosts": 
#    master_ip => "192.168.56.6",
#    host_fqdn => "somedomain.com",
#    master_fqdn => "stenarmaster.example.com",
#    master_hostname => "stenarmaster",
#  }
  
class hosts($host_ip = undef,
            $host_fqdn = undef,
            $master_ip = undef, 
            $master_fqdn = "stenarmaster.example.com", 
            $master_hostname = "stenarmaster"
) inherits hosts::params {
  
  if $host_ip == undef {
    $ip = $::ipaddress 
  }
  else {
    $ip = $host_ip 
  } 
  
  if $host_fqdn == undef {
    $hfqdn = $::fqdn 
  }
  else {
    $hfqdn = $host_fqdn
  }
  
  file { '/etc/hosts':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("hosts/etc/hosts.erb"),
  }
  
  file { '/etc/host.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("hosts/etc/host.conf.erb"),
  }
}