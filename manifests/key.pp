define dhcpd::key (
    $secret,
    $keyname   = $title,
    $algorithm = $dhcpd::params::key_algorithm,
    $conf_file = $dhcpd::conf_file,
) {

    include stdlib

    concat::fragment { "${conf_file}#key${title}":
        target  => $conf_file,
        content => template('dhcpd/key.conf.erb'),
        order   => '10',
    }

}
