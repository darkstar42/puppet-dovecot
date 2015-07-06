# == Class module::install
#
# This class is called from module for install.
#
class module::install {

  package { $::module::package_name:
    ensure => present,
  }
}
