# == Class he_ipv6::service
#
# This class is meant to be called from he_ipv6
# It ensure the service is running
#
class he_ipv6::service {

  service { $he_ipv6::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
