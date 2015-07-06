# == Class: module
#
# Full description of class module here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class module (
  $package_name = $::module::params::package_name,
  $service_name = $::module::params::service_name,
) inherits ::module::params {

  # validate parameters here

  class { '::module::install': } ->
  class { '::module::config': } ~>
  class { '::module::service': } ->
  Class['::module']
}
