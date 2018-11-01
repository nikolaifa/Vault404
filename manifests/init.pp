# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault
 class vault (

	$base_url 					= $vault::params::base_url,
	$version				        = $vault::params::version,
	$os_tmp						= $vault::params::os_tmp,
	$processor					= $vault::params::processor,
	$download_url					= $vault::params::download_url,
	

 ) { 

	contain ::vault::install
	contain ::vault::config
	contain ::vault::service

	Class['vault::install']-> Class['vault::config']
	Class['vault::config'] ~> Class['vault::service']

 
   }
