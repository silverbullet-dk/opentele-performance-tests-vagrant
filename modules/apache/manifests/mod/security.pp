class apache::mod::security {
  package { "libapache2-modsecurity": ensure => "installed" } 

  apache::mod { 'unique_id': }

  file { "${apache::mod_dir}/mod-security.load":
    ensure => present,
    content => template('apache/mod/mod-security.load.erb'),
  }

  file { "${apache::mod_enable_dir}/mod-security.load":
    ensure => link,
    target => "${apache::mod_dir}/mod-security.load",
  }


  file { "${apache::mod_dir}/mod-security.conf":
    ensure  => present,
    content => template('apache/mod/mod-security.conf.erb'),
  }


  file { "${apache::mod_enable_dir}/mod-security.conf":
    ensure  => link,
    target => "${apache::mod_dir}/mod-security.conf",
    notify  => Service['httpd'],
  }

}
