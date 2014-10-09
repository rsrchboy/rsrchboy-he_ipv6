# == Class he_ipv6::install
#
class he_ipv6::install {

  package { $he_ipv6::package_name:
    ensure => present,
  }
}
