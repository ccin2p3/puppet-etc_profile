@common_values = {
  sh: {
    file: {
      path: '/etc/profile.d/site.sh',
    },
    dir: {
      path: '/etc/profile.d/site',
    },
  },
}
@os_values = {
  'RedHat' => @common_values.merge(
    csh: {
      file: {
        path: '/etc/profile.d/site.csh',
      },
      dir: {
        path: '/etc/profile.d/site',
      },
    },
  ),
  'Debian' => @common_values.merge(
    csh: {
      file: {
        path: '/etc/csh/login.d/site.csh',
      },
      dir: {
        path: '/etc/csh/login.d/site',
      },
    },
  ),
}
