# == Class: apache
#
# Install apache and ensure service is running.
#
# === Examples
#
#  include apache
#
# === Authors
#
# Bryan J Swift <bryan.j.swift@gmail.com>
#
# === Copyright
#
# Copyright 2012 Bryan J Swift
#
class apache {

  include apache::install, apache::service

}
