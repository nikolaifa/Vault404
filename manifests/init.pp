# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault
 class vault (

	String $base_url,
	String $version,
	String $os_tmp,
	String $processor, 
	String $download_url,

 ) { 

  contain vault::install 
  contain vault::config
  Class['::vault::install']
  -> Class['::gossinbackup::config']

 
   }
