# Class: test::uninstall
#
# This module uninstalls test
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class test::uninstall {
  notify { "Uninstalling!": }
  
  #Set selinux back to enforcing.
  include selinux
  class { 'selinux':
    mode => 'enforcing'
  }
  
  file { '/var/test':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  }
  
  file {'remove_directory':
    ensure  => absent,
    path    => '/var/test',
    recurse => true,
    purge   => true,
    force   => true,
  }  
}
