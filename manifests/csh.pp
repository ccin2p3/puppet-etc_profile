# etc_profile::csh
#
# Sets up profiles for C shells
#
# @summary sets up profiles for csh
#
# @example
#   include etc_profile::csh
class etc_profile::csh (
  Hash $config,
) {
  unless defined(File[$config['dir']['path']]) {
    file { 'etc_profile csh dir':
      * => $config['dir']
    }
  }
  file { 'etc_profile csh file':
    path    => $config['file']['path'],
    content => epp($config['file']['epp']),
  }
}
