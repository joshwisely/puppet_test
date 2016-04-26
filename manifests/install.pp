# Class: test::install
#
# This module installs test
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class test::install {
  notify { "Installing!": }
  
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
  
  #Set selinux to permissive.
  class { 'selinux':
    mode => 'permissive'  
  }
  
  #Remove repo package.
  package { 'git':
    ensure => installed,
  }

  class{ 'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
  }
  
  vcsrepo { '/var/test':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/puppetlabs/exercise-webpage.git',
  }

  file { '/var/test':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0655',
    recurse => true
  }
    
  nginx::resource::vhost { 'test':
    ensure               => present,
    server_name          => ['test'],
    listen_port          => 8000,
    www_root             => '/var/test',
  }
}
