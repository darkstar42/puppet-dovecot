# == Class dovecot::install
#
class dovecot::install {

  package { $::dovecot::package_name:
    ensure => present,
  }
}

