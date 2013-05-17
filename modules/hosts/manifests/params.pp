class hosts::params {
#  case $::lsbdistcodename {
#    'quantal', '' 'squeeze': {
#    }
#    default: {
#      fail("Module ${module_name} does not support ${::lsbdistcodename}")
#    }
#  }
}