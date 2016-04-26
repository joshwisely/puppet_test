class test::install {
  notify { "Installing!": }
  
  class{'nginx':
      manage_repo => true,
      package_source => 'nginx-mainline'
  }

}
