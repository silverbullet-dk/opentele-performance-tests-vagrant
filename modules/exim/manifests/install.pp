class exim::install {
    package { $exim::params::exim_package_name:
      ensure => present,
    }
}
