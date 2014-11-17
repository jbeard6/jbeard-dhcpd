define dhcpd::subnet (
    $network,
    $netmask,
    $authoritative = true,
    $range         = undef,
    $broadcast     = undef,
    $routers       = $dhcpd::params::routers,
    $nameservers   = $dhcpd::params::nameservers,
    $ntpservers    = $dhcpd::params::ntpservers,
    $lease_default = $dhcpd::params::lease_default,
    $lease_max     = $dhcpd::params::lease_max,
    $conf_file     = $dhcpd::conf_file,
) {

    include stdlib

    concat::fragment { "${conf_file}#subnet${title}":
        target  => $conf_file,
        content => template('dhcpd/subnet.conf.erb'),
        order   => '30',
    }

}
