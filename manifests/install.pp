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
    require => File['/opt'],
    ensure => 'directory',
  }
  file { '/opt/puppetlabs/server':
    require => File['/opt/puppetlabs'],
    ensure => 'directory',
  }
  file { '/opt/puppetlabs/server/data':
    require => File['/opt/puppetlabs/server'],
    ensure => 'directory',
  }
  file { '/opt/puppetlabs/server/data/puppetserver':
    require => File['/opt/puppetlabs/server/data'],
    ensure => 'directory',
  }
  
  #Set selinux to permissive.
  class { 'selinux':
    require => File['/opt/puppetlabs/server/data/puppetserver'],
    mode => 'permissive'  
  }
  
  #Make sure git exists.
  package { 'git':
    ensure => installed,
  }

  #Clone data from git repo.
  vcsrepo { '/var/test':
    require => Package['git'],
    ensure   => present,
    provider => git,
    source   => 'https://github.com/puppetlabs/exercise-webpage.git',
  }

  #Ensure file permissions are set correctly.
  file { '/var/test':
    require => Vcsrepo['/var/test'],
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0655',
    recurse => true
  }

  #Setup nginx to manage it's own repo.
  class{ 'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
  }
  
  #Setup vhost for test website.    
  nginx::resource::vhost { 'test':
    require => Class['nginx'],
    ensure               => present,
    server_name          => ['test'],
    listen_port          => 8000,
    www_root             => '/var/test',
  }
}
