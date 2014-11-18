define dhcpd::zone (
    $nameserver,
    $key,
    $domain    = $title,
    $conf_file = $dhcpd::conf_file,
) {

    include stdlib

    concat::fragment { "${conf_file}#zone${domain}":
        target  => $conf_file,
        content => template('dhcpd/zone.conf.erb'),
        order   => '20',
    }

}
