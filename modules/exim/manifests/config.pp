class exim::config (
) inherits exim::params {

    file { "$exim_directory":
          ensure => "directory",
          owner  => "root",
          group  => "root",
          mode   => 750,
    }

    file { "$exim_password":
           ensure  => present,
           source  => "puppet:///modules/exim/passwd.client",
           owner   => root,
           group   => root,
           mode    => 0660,
    }

   file { "$exim_package_config":
           ensure  => present,
	   content => template("exim/update-exim4.conf.conf.erb"),
           owner   => root,
           group   => root,
           mode    => 0660,
  	notify => Service["exim4"],
    }

    file { "$exim_config":
           ensure  => present,
           source  => "puppet:///modules/exim/exim4.conf.template",
           owner   => root,
           group   => root,
           mode    => 0660,
    }

    file { "$exim_aliases":
           ensure  => present,
           source  => "puppet:///modules/exim/aliases",
           owner   => root,
           group   => root,
           mode    => 0660,
 	notify => Service["exim4"],
    }


}
