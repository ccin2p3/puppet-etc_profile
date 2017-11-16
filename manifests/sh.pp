# etc_profile::sh
#
# Sets up profiles for Bourne shell
#
# @summary profiles for sh
#
# @example
#   include etc_profile::sh
class etc_profile::sh (
  Hash $config,
) {
  file { 'etc_profile sh dir':
    * => $config['dir']
  }
  file { 'etc_profile sh file':
    path    => $config['file']['path'],
    content => epp($config['file']['epp']),
  }
}
