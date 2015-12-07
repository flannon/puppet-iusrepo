class iusrepo::params {
  $baseurl = "https://dl.iuscommunity.org/pub/ius/stable/CentOS/${::os_maj_version}/${::architecture}"
 
  $mirrorlist = "https://mirrors.iuscommunity.org/mirrorlist?repo=ius-centos${os_maj_version}-debuginfo&arch=${::architecture}&protocol=http"
  
  $repos = {'ius.repo' => 'ius','ius-archive' => 'ius-archive','ius-dev' => 'ius-dev', 'ius-release' => 'ius-release', 'ius-testing' => 'ius-testing'}

  $includepkgs = { 'ius.repo' => abscent, 'ius-archive' => abscent, 'ius-dev' => abscent, 'ius-release' => abscent, 'ius-testing' => abscent}

  $exclude = { 'ius.repo' => abscent, 'ius-archive' => abscent, 'ius-dev' => abscent, 'ius-release' => abscent, 'ius-testing' => abscent}

  $enabled = [ 'ius' ]

}
