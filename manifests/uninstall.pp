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
  
  #Stop and disable service.
  service { 'nginx':
    enable => false,
    ensure => stopped,
  }
  
  #Remove package.
  package { 'nginx':
    ensure => absent,
  }
  
  #Remove repo package.
  package { 'epel-release':
    ensure => absent,
  }
   
  #Set selinux back to enforcing.
  class { 'selinux':
    mode => 'enforcing'
    #modules_dir => ''
  }
  
  #Remove files.
  file {'remove_directory':
    ensure  => absent,
    path    => '/var/test',
    recurse => true,
    purge   => true,
    force   => true,
  }  
}
