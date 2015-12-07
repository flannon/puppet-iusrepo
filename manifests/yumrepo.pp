#
define iusrepo::yumrepo (
  $repos,
  $repo_shortname = $name,
  $baseurl,
  $mirrorlist,
  $enabled,
  $includepkgs,
  $exclude,
) {
  $reponame = $repos[$title]

  validate_array($enabled)

  yumrepo {
    $reponame :
      descr       => "IUS Community Packages for Enterprise Linux ${::os_maj_version} - ${architecture}",
      baseurl     => "${baseurl}",
      mirrorlist  => "${mirrorlist}",
      enabled     => bool2num(member($enabled,$title)),
      protect     => 1,
      gpgcheck    => 0,
      gpgkey      => 'file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
      includepkgs => $includepkgs[$repo_shortname],
      exclude     => $exclude[$repo_shortname],
  }
}
