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

  include test::install
}
