# == Class: he_ipv6
#
# Full description of class he_ipv6 here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class he_ipv6 (
  $package_name = $he_ipv6::params::package_name,
  $service_name = $he_ipv6::params::service_name,
) inherits he_ipv6::params {

  # validate parameters here

  class { 'he_ipv6::install': } ->
  class { 'he_ipv6::config': } ~>
  class { 'he_ipv6::service': } ->
  Class['he_ipv6']
}
