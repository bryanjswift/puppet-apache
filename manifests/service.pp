# == Class: apache::service
#
# Ensure apache service is installed and running.
#
# === Examples
#
#  include apache::service
#
# === Authors
#
# Bryan J Swift <bryan.j.swift@gmail.com>
#
# === Copyright
#
# Copyright 2012 Bryan J Swift
#
class apache::service {

  service { 'apache':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'apache2',
    require    => [Class['apache::install']],
  }

}
