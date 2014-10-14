#
# Name: opentele1.silverbullet.dk
# Role: opentele server
#
  #Path
  Exec {
    path => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
  }

  stage { 'pre':
    before => Stage['main'],
  }

  stage { 'post': }
  Stage['main'] -> Stage['post']

  class { 'apt':
    always_apt_update  => true,
    stage=> 'pre'
  }

  # Setup mysql 
  class { '::mysql::server':
    root_password => 'Silverbullet1',
  }

  package { 'collectl': ensure => "installed" }
  package { 'gnuplot-x11': ensure => "installed"}


  $dbuser = "opentele"
  $dbpass = "opentele"
  $dbname = "opentele"
                
  mysql::db { $dbname:
    user     => $dbuser,
    password => $dbpass,
    host     => 'localhost',
    grant    => ['ALL'],
  } 

  # Setup datamon config file
  file { "/home/tomcat/":
    ensure => "directory",
    owner => "tomcat",
    group => "adm",
    mode => "0750",
  }

  file { "/home/tomcat/.kih":
    ensure => "directory",
    owner => "tomcat",
    group => "adm",
    mode => "0750",
  }

  file { "/home/tomcat/.kih/datamon-config.properties":
    ensure => "present",
    owner => "tomcat",
    group => "adm",
    mode => "0640",
    replace => true,
    content => template("opentele/datamon-config.properties.erb"),
 }

  
  # Java
  class { 'java::oracle_1_7_0':
    stage=> 'pre'
  } 

  # Pick default JDK
  package { "oracle-java7-set-default": ensure => "installed" }

 # 

  # Tomcat 
  $tomcat_mirror = "http://archive.apache.org/dist/tomcat/"
  $tomcat_version = "7.0.53"

  class { 'tomcat':
    version     => 7,
    sources     => true,  
  }

  tomcat::instance {"opentele":
    ensure    => present,
    java_home => "/usr/lib/jvm/java-7-oracle",
    http_port => "8080",
    ajp_port    => "8009",
  }