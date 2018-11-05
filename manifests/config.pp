# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::config
class vault::config {

  file { "${::vault::destination_dir}data":
    ensure => 'directory',
      owner => 'vault',
      group => 'vault',
      mode  => '0640',
  }

  file { "${::vault::destination_dir}vault.json":
    ensure  => file,
    content => to_json($::vault::vault_config),

      owner => 'vault',
      group => 'vault',
      mode  => '0640',
  }


  case $::vault::kernel {
    'linux': {
      file { "${::vault::service_path}vault.service":
        ensure  => present,
        owner   => 'vault',
        group   => 'vault',
        mode    => '0640',
        content => template('vault/vault.systemd.erb'),
      }
      ~> Class['systemd::systemctl::daemon_reload']
    }
    'windows': {

    }
    default: {
      fail("Unsupported kernel: ${::vault::kernel}")
    }
  }
}
