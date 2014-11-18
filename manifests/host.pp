class dhcpd::host (
    $hardware,
    $address,
    $hostname  = $title,
    $conf_file = $dhcpd::conf_file,
) {

    include stdlib

    concat::fragment { "${conf_file}#host${title}":
        target  => $conf_file,
        content => template('dhcpd/host.conf.erb'),
        order   => '40',
    }

}
