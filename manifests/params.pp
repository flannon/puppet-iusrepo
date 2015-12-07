class iusrepo::params {
  $baseurl = "https://dl.iuscommunity.org/pub/ius/stable/CentOS/${::os_maj_version}/${::architecture}"
 
  $mirrorlist = "https://mirrors.iuscommunity.org/mirrorlist?repo=ius-centos${os_maj_version}-debuginfo&arch=${::architecture}&protocol=http"
  
  $repos = {'ius' => 'ius','archive' => 'ius-archive', 'testing' => 'ius-testing'}
  #$repos = {'ius.repo' => 'ius'}

  $includepkgs = { 'ius' => abscent, 'archive' => abscent, 'testing' => abscent}
  #$includepkgs = { 'ius.repo' => abscent}

  $exclude = { 'ius' => abscent, 'archive' => abscent, 'testing' => abscent}
  #$exclude = { 'ius.repo' => abscent}

  $enabled = [ 'ius' ]

}
