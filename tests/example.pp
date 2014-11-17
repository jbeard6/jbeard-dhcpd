class { 'dhcpd':
    ensure              => installed,
    service             => running,
    enable              => true,
    domain              => 'dhcp.example.com',
    search              => [ 'dhcp.example.com', 'example.com', ],
    ddns_updates        => true,
    ddns_update_style   => 'interim',
    ddns_client_updates => 'ignore',
}

dhcpd::key { 'example.org':
    algorithm => 'hmac-md5',
    secret    => 'notrevealed==',
}

dhcpd::zone { 'dhcp.example.com':
    domain     => 'dhcp.example.com.',
    nameserver => 'ns.example.com',
    key        => 'example.org',
}

dhcpd::subnet { 'eth0':
    network       => '192.168.1.0',
    netmask       => '255.255.255.0',
    authoritative => true,
    range         => '192.168.1.100 192.168.1.250',
    broadcast     => '192.168.1.255',
    routers       => '192.168.1.1',
    nameservers   => [ 'ns.example.com', '8.8.8.8', '8.8.4.4', ],
    lease_default => 3600,
}
