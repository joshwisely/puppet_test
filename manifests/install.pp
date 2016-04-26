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
  
  class{'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
  }
  
  file { '/var/test':
    ensure => 'directory',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0750',
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
    mode => '0644',
    content => epp('templates/index.html.epp'),
  }

}
