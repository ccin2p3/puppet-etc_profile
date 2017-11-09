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
  Etc_Profile::EntryPath $path = $name,
) {
  file { "etc_profile entry ${name}":
    path => "${etc_profile::config[dir][path]}/${path}.sh",
    *    => $config,
  }
}

