class exim::params {
  case $operatingsystem {
    /(Ubuntu|Debian)/: {
      $exim_directory = '/etc/exim4'
      $exim_package_name = 'exim4-daemon-light'
      $exim_password = "${exim_directory}/passwd.client"
      $exim_package_config = "${exim_directory}/update-exim4.conf.conf"
      $exim_config = "${exim_directory}/exim4.conf.template"
      $exim_aliases = "/etc/aliases"
      $exim_service_name = 'exim4'
	}
  }
}
