# == Class: dovecot::sieve
#
class dovecot::sieve (
  $user = 'vmail',
  $group = 'vmail',
) {
  include ::dovecot

  validate_string($user, group)

  $package_name = $::osfamily ? {
    'Debian' => 'dovecot-sieve',
    default  => 'dovecot-sieve'
  }

  package { $package_name: 
    ensure  => installed,
    before  => Exec['dovecot'],
    alias   => 'dovecot-sieve',
  }

  file { '/var/lib/dovecot/sieve':
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    require => Package[$package_name],
  }
}

