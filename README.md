# dhcpd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dhcpd](#setup)
    * [What dhcpd affects](#what-dhcpd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dhcpd](#beginning-with-dhcpd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the [ISC DHCP daemon][isc].

## Module Description

This module installs and runs the [ISC DHCP daemon][isc].  This module
configures the daemon by building up the `dhcpd.conf` file with via defined
resources.

## Setup

### What dhcpd affects

The dhcpd module will install the appropriate packages for RedHat and Debian
distributions.  Furthermore, it constructs the configuration files required for
the daemon according to corresponding resources.  It also controls the
execution of the appropriate daemon services.

### Setup Requirements

This module requires the [puppetlabs/stdlib][stdlib] and
[puppetlabs/concat][concat] modules.

### Beginning with dhcpd

Simply including this module will install and execute the dhcpd service on
your host, however it will not be functional without a subnet definition.

## Usage

A sample configuration illustrates the basic usage of this module.

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


## Reference

_TODO_ List all the classes and organization

## Limitations

This module has been tested on:

  * RedHat Enterprise Linux 6
  * CentOS 6
  * Debian Wheezy

## Development

Please feel free to submit issues and pull requests to the project's [Github
page][jbeard-dhcpd].  Changes are periodically reviewed, merged, and published
back to the Puppet Forge.


[jbeard-dhcpd]: https://github.com/jbeard6/jbeard-dhcpd "jbeard6/jbeard-dhcpd"
[isc]: https://www.isc.org/downloads/dhcp/ "DHCP | Internet Systems Consortium"
[stdlib]: http://forge.puppetlabs.com/puppetlabs/stdlib "puppetlabs/stdlib - Puppet Forge"
[concat]: http://forge.puppetlabs.com/puppetlabs/concat "puppetlabs/concat - Puppet Forge"
