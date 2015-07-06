# == Class dovecot::params
#
#
class dovecot::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'dovecot-core'
      $service_name = 'dovecot'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

