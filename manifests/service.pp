# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::service

class vault::service {
  case $::vault::kernel {
    'linux': {
      service { 'vault':
        ensure    => running,
        name      => vault,
        enable    => true,
        provider  => $::vault::provider,
        subscribe => File["${::vault::service_path}vault.service"],
      }
    }
    'windows': {
      service { 'vault':
        ensure => running,
        start  => "${::vault::destination_dir}vault server -config=${::vault::destination_dir}vault.json",
        name   => vault,
        enable => true,
      }
    }
    default: { fail('Failed to start vault') }
  }
}
