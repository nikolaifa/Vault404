# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
class vault (

	$base_url 					= $vault::params::base_url,
	$version				        = $vault::params::version,
	$os_tmp						= $vault::params::os_tmp,
	$processor					= $vault::params::processor,
	$download_url					= $vault::params::download_url,
	$server_url 					= $vault::params::server_url,
	$destination_dir				= $vault::params::destination_url,
	$binary_dir					= $vault::params::binary_dir,
	$config_dir					= $vault::params::config_dir	

 ) inherits vault::params { 

	contain vault::install
	contain vault::config
#	contain vault::service

	Class['vault::install']
	-> Class['vault::config']
#	~> Class['::vault::service']

 
   }
