define apache::vhost(
  $port,
  $parents       = '',
  $docroot,
  $logdir        = '/var/log/apache2',
  $ssl           = true,
  $template      = 'apache/vhost.conf.erb',
  $priority,
  $serveraliases = '',
  $options       = 'Indexes FollowSymLinks MultiViews',
  $override      = 'All',
  $owner         = false,
  $group         = false,
) {

  include apache

  if ($owner) {
    File { owner => $owner }
  }

  if ($group) {
    File { group => $group }
  }

  file { "/etc/apache2/sites-enabled/${priority}-${name}":
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => 0744,
    require => [Class["apache::install"]],
    notify  => [Class["apache::service"]],
  }

  if ($parents != '') {
    file { $parents:
      ensure  => directory,
      mode    => 0755,
      require => [],
    }
  }

  file { "${docroot}":
    ensure  => directory,
    mode    => 0755,
    require => $parents ? {
      ''      => [],
      default => [File[$parents]]
    },
  }

  file { "${logdir}":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

}
