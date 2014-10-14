# == Class: java::oracle_1_6_0::params
#
# This class manages parameters for the java Puppet class in this module.
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Sander Bilo <sander@proteon.nl>
#
# === Copyright
#
# Copyright 2013 Proteon.
#
class java::oracle_1_6_0::params {
    $home = '/usr/lib/jvm/java-6-oracle'
    $package = 'oracle-java6-installer'
}
