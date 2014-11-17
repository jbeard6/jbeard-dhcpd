class dhcpd::packages (
    $ensure   = $dhcpd::ensure,
    $packages = $dhcpd::packages,
) {

    package { $packages:
        ensure => $ensure,
    }

}
