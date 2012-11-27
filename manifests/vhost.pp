define apache::vhost(
    $port,
    $parents='',
    $docroot,
    $logdir="/var/log/apache2",
    $ssl=true,
    $template="apache/vhost.conf.erb",
    $priority,
    $serveraliases='',
    $options="Indexes FollowSymLinks MultiViews",
) {

  include apache

  File {
    owner   => "root",
    group   => "root",
    require => $parents ? {
      ''      => [],
      default => [File[$parents]]
    },
  }

  file { "/etc/apache2/sites-enabled/${priority}-${name}":
    content => template($template),
    mode    => 0777,
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
  }

  file { "${logdir}":
    ensure => directory,
    mode   => 0755,
  }

}
