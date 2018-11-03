# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
 #include vault
 class vault (
	$base_url 					= $::vault::params::base_url,
	$version				        = $::vault::params::version,
	$kernel						= $::vault::params::kernel,
	$processor					= $::vault::params::processor,
	$destination_dir				= $::vault::params::destination_dir,
	$binary_dir					= $::vault::params::binary_dir

 ) inherits ::vault::params { 
	$download_url = "${base_url}/${version}/vault_${version}_${kernel}_${processor}.zip"
	
  	include stdlib
	contain ::vault::install
	contain ::vault::config
	contain ::vault::service

	Class['vault::install'] -> 
	Class['vault::config'] ~>
	Class['vault::service']
   }
