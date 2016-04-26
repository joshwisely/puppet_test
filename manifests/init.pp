# Class: test
#
# This module manages test
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class test {
  notify { "Using test class.": }

  #Install by default.
  include test::install
}
