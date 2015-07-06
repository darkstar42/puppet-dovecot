# == Class: dovecot
#
# This class provides a basic setup of dovecot
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class dovecot (
  $auth_mechanisms = 'plain login',
  $log_timestamp = '%Y-%m-%d %H:%M%:S',
  $protocols = 'imap',
  $listen = '*',
  $ssl_cert = undef,
  $ssl_key = undef,
  $mail_max_userip_connections = 10

  $package_name = $::dovecot::params::package_name,
  $service_name = $::dovecot::params::service_name,
) inherits ::dovecot::params {
  
  validate_string($auth_mechanisms)
  validate_string($log_timestamp)
  validate_string($protocols)
  validate_string($listen)
  validate_string($ssl_cert)
  validate_string($ssl_key)
  validate_integer($mail_max_userip_connections)

  class { '::dovecot::install': } ->
  class { '::dovecot::config': } ~>
  class { '::dovecot::service': } ->
  Class['::dovecot']
}

