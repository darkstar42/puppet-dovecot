# == Class dovecot::service
#
class dovecot::service {
  service { $::dovecot::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

