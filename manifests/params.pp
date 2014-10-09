# == Class he_ipv6::params
#
# This class is meant to be called from he_ipv6
# It sets variables according to platform
#
class he_ipv6::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'he_ipv6'
      $service_name = 'he_ipv6'
    }
    'RedHat', 'Amazon': {
      $package_name = 'he_ipv6'
      $service_name = 'he_ipv6'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
