# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
include vault::install
include '::archive'

class vault::install {
	$base_url = 'https://releases.hashicorp.com/vault'
	$version = '0.11.4'
	$os_tmp = 'linux'
	$processor = 'amd64'
	$download_url = "${base_url}/${version}/vault_${version}_${os_tmp}_${processor}.zip"
	$install_dir = 'opt'
	
	archive { "/tmp/vault.zip":
		ensure 		=> present,
		extract 	=> true,
		extract_path	=> "/${install_dir}/",
		source 		=> $download_url,
#		checksum_type	=> sha256
#		checksum_url	=>
#		sjekke file integritet
#		sjekke signatur?
		creates		=> "${install_dir}/vault",
		cleanup		=> true,
	}
}

#Installation methods:
#Url
#	Base_url: https://releases.hashicorp.com/vault/
#	Version: 0.11.4
#	OS: Linux
#	Processor: amd64
#	URL: $Base_url$Version/vault_$Version_$OS_$Processor.zip 
#	Download_dir: /tmp
#	Extract: True
#	Install_dir: /opt/vault
# checksum? Signature?
# modes 
