# etc_profile
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include etc_profile
class etc_profile (
  Hash $config,
) {
  file { 'etc_profile dir':
    * => $config['dir']
  }
  file { 'etc_profile file':
    path    => $config['file']['path'],
    content => epp($config['file']['epp']),
  }
}
