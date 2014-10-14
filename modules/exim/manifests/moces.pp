class exim::moces {

  file { "${exim::params::ssl_directory}/update-crl.sh":
           ensure  => present,
           source  => "puppet:///modules/exim/update-crl.sh",
           owner   => root,
           group   => root,
           mode    => 0755,
    }

    file { '/etc/cron.hourly/update-crl':
         ensure => 'link',
         target => '/etc/apache2/cert/update-crl.sh',
     }

     package { "curl": ensure => "installed",}

     exec { "refresh_moces_revovcation":
           command => "update-crl.sh",
           path    => "${exim::params::ssl_directory}:/bin/:/usr/bin:/usr/local/bin/:/bin/",
           creates => "${exim::params::ssl_directory}/ocespem.crl",
       }
       
     
 }
