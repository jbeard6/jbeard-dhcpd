class dhcpd::config (
    $ensure    = $dhcpd::ensure,
    $conf_file          = $dhcpd::conf_file,
    $ddns_updates       = $dhcpd::ddns_updates,
    $ddns_update_style  = $dhcpd::ddns_update_style,
    $ddns_ignore        = $dhcpd::ddns_ignore,
    $ddns_update_static = $dhcpd::ddns_update_static,
    $ddns_key           = undef,
    $ddns_key_file      = undef,
    $include            = [],
) {

    concat { $conf_file:
        ensure => $ensure ? {
                    absent  => absent,
                    default => present,
                  },
    }

    concat::fragment { "${conf_file}#header":
        target  => $conf_file,
        content => template('dhcpd/header.conf.erb'),
        order   => '01',
    }

}
