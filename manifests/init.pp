# == Class: iusrepo
#
# Full description of class iusrepo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'iusrepo':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class iusrepo (
  $enabled = $iusrepo::params::enabled,
  $baseurl = $iusrepo::params::baseurl,
  $mirrorlist = $iusrepo::params::mirrorlist,
  $includepkgs = {},
  $exclude = {},
) inherits iusrepo::params {

  validate_array($iusrepo::enabled)
  validate_string($iusrepo::baseurl,$iusrepo::mirorllist)

  if $::osfamily == 'RedHat' {
    $repolist = keys($iusrepo::params::repos)

    iusrepo::yumrepo {
      $iusrepo::repolist:
        require     => Iusrepo::Rpm_gpg_key['IUS-COMMUNITY-GPG-KEY'],
        repos       => $iusrepo::params::repos,
        baseurl     => $iusrepo::baseurl,
        mirrorlist  => $iusrepo::mirrorlist,
        enabled     => $iusrepo::enabled,
        includepkgs => merge($iusrepo::params::includepkgs, $includepkgs),
        exclude     => merge($iusrepo::params::exclude, $exclude),
    }

    file {'/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY' :
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/iusrepo/IUS-COMMUNITY-GPG-KEY',
    }
    iusrepo::rpm_gpg_key { 'IUS-COMMUNITY-GPG-KEY' :
      path => '/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    }

  } else {
    notice ("OS ${::operatingsystem} not currently supported by iusrepo.  ius.repo not installed.")
  }
}
