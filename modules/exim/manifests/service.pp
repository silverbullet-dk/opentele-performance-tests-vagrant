class exim::service {

    service { $exim::params::exim_service_name:
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      enable => true,
      require => Class["exim::config"],
    }
  }
