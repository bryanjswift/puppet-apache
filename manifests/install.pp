# == Class: apache::install
#
# Install apache.
#
# === Examples
#
#  include apache::install
#
# === Authors
#
# Bryan J Swift <bryan.j.swift@gmail.com>
#
# === Copyright
#
# Copyright 2012 Bryan J Swift
#
class apache::install {

  package { 'apache2':
    ensure => present,
  }

}
