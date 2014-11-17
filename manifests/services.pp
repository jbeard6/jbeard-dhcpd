class dhcpd::services (
    $ensure   = $dhcpd::service,
    $enable   = $dhcpd::enable,
    $services = $dhcpd::services,
) {

    service { $services:
        ensure     => $ensure,
        enable     => $enable,
        hasstatus  => true,
        hasrestart => true,
    }

}
