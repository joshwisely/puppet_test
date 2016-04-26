class test::install {

  class{'nginx':
      manage_repo => true,
      package_source => 'nginx-mainline'
  }
  notify { "Installing!": }

}
