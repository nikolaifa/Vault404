# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault::params
class vault::params {

	$base_url			='https://releases.hashicorp.com/vault'
	$version			='0.11.4'
	$os_tmp				='linux'
	$processor			='amd64'
	$download_url			='${base_url}/${version}/vault_${version}_${os_tmp}_${processor}.zip'

}
