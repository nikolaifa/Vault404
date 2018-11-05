# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault
class vault (
  $base_url           = $::vault::params::base_url,
  $version                = $::vault::params::version,
  $kernel            = $::vault::params::kernel,
  $processor          = $::vault::params::processor,
  $destination_dir        = $::vault::params::destination_dir,
  $service_path          = $::vault::params::service_path,
  $provider           = $::vault::params::provider,
  $download_url          = $::vault::params::download_url
) inherits ::vault::params {
  include stdlib
#	include ::openssl
  include systemd::systemctl::daemon_reload
  include stdlib
  include archive

  contain ::vault::install
  contain ::vault::config
  contain ::vault::service

  Class['vault::install']
  -> Class['vault::config']
  ~> Class['vault::service']
  }
