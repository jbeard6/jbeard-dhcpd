# == Class: dhcpd
#
# Full description of class dhcpd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'dhcpd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class dhcpd (
    $ensure,
    $service,
    $enable,
    $domain,
    $search,
    $packages            = $dhcpd::params::packages,
    $services            = $dhcpd::params::services,
    $conf_file           = $dhcpd::params::conf_file,
    $ddns_updates        = $dhcpd::params::ddns_updates,
    $ddns_update_style   = $dhcpd::params::ddns_update_style,
    $ddns_client_updates = $dhcpd::params::ddns_client_updates,
    $ddns_update_static  = $dhcpd::params::ddns_update_static,
    $include             = [],
) inherits dhcpd::params {

    require stdlib

    anchor { 'dhcpd::begin':
    } ->
    class { 'dhcpd::packages':
    } ->
    class { 'dhcpd::config':
    } ~>
    class { 'dhcpd::services':
    } ->
    anchor { 'dhcpd::end':
    }

}
