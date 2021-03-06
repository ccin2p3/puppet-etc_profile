# etc_profile::entry
#
# This type defines a new system profile, usually in the form of a file in /etc/profile.d/site/

# @summary System profile entry
#
# @example
#   etc_profile::entry { 'bash_completion':
#     content => 'export FOO="bar"'
#   }
define etc_profile::entry(
  Hash $config,
  Etc_profile::Entrytype $type = 'sh',
  Etc_profile::Entrypath $path = $name,
) {
  case $type {
    'sh': {
      include ::etc_profile::sh
      file { "etc_profile sh entry ${name}":
        path         => "${etc_profile::sh::config[dir][path]}/${path}.sh",
        *            => $config,
        validate_cmd => '/bin/sh -n "%"',
      }
    }
    'csh': {
      include ::etc_profile::csh
      file { "etc_profile csh entry ${name}":
        path         => "${etc_profile::csh::config[dir][path]}/${path}.csh",
        *            => $config,
        validate_cmd => '/bin/csh -n "%"',
      }
    }
    default: {
      fail('unsupported type')
    }
  }
}

