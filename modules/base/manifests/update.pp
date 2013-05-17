
class base::update {
  
  # update upgrade
  exec {'update':
    command => 'sudo apt-get update',
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
  } ->
  
  notify {'update': 
    message => 'Update apt Ubuntu',
  } ->
  
  exec {'upgrade':
    command => 'sudo apt-get upgrade -y',
    path        => '/bin:/usr/bin:/sbin:/usr/sbin',
  } ->      
  
  notify {'upgrade': 
    message => 'Upgrade apt Ubuntu',
  }
  
}