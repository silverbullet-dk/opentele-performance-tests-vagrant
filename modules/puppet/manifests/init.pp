class puppet($certname = undef, $master = undef) {
    include puppet::install, puppet::config, puppet::service
}
