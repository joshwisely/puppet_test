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

}
