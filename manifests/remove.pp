# == Class: apache::remove
#
# Ensure apache service is not running and is not installed.
#
# === Examples
#
#  include apache::remove
#
# === Authors
#
# Bryan J Swift <bryan.j.swift@gmail.com>
#
# === Copyright
#
# Copyright 2012 Bryan J Swift
#
class apache::remove {

  service { 'apache stopped':
    ensure     => stopped,
    enable     => false,
    hasrestart => true,
    hasstatus  => true,
    name       => 'apache2',
  }

  package { 'apache2 removed':
    ensure  => absent,
    require => [Service['apache stopped']],
  }

}
