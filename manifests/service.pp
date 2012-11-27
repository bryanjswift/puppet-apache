class apache::service {

  service { "apache":
    enable     => true,
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    name       => "apache2",
    require    => [Class["apache::install"]],
  }

}
