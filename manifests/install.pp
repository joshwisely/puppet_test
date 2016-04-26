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
  file { '/opt/puppetlabs/server/data/puppetserver':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  }
  
  #Set selinux to permissive.
  class { 'selinux':
    mode => 'permissive'
  }
  
  class{ 'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
  }
  
  file { '/var/test':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  }
  
  nginx::resource::vhost { 'test':
    ensure               => present,
    server_name          => ['test'],
    listen_port          => 8000,
    www_root             => '/var/test',
  }
  
  file { '/var/test/index.html':
    owner => 'root',
    group => 'root',
    mode => '0666',
    #content => epp('index.html.epp'),
    content => "<!DOCTYPE html><html><body><p>It works!</p></body></html>",
  }

}
