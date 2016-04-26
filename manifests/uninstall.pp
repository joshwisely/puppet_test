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

  #Remove git dependant packages first.
  package { 'perl-Git':
    ensure => absent,
  }
  #Remove git package.
  package { 'git':
    ensure => absent,
  }
  
  #Not sure why but selinux needs this.
  file { '/opt':
    ensure => 'directory',
  }
  file { '/opt/puppetlabs':
    ensure => 'directory',
  }
  file { '/opt/puppetlabs/server':
    ensure => 'directory',
  }
  file { '/opt/puppetlabs/server/data':
    ensure => 'directory',
  }
  file { '/opt/puppetlabs/server/data/puppetserver':
    ensure => 'directory',
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
