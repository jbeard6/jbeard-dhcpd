class dhcpd::params {

    $packages = $::osfamily ? {
                    redhat => 'dhcp',
                    debian => 'isc-dhcp-server',
                }
    $services = $::osfamily ? {
                    redhat => 'dhcpd',
                    debian => 'isc-dhcp-server',
                }
    $conf_file = '/etc/dhcp/dhcpd.conf'

    $ddns_updates       = false
    $ddns_update_style  = 'interim'
    $ddns_ignore        = 'client-updates'
    $ddns_update_static = true

    $routers       = undef
    $nameservers   = undef
    $ntpservers    = undef
    $lease_default = 3600
    $lease_max     = 7200

    $key_algorithm = 'hmac-md5'

}
