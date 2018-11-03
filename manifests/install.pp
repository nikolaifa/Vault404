# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::install
include '::archive'

class vault::install {

	file { '/opt/vault':
		ensure => 'directory',
	}

	archive { "/tmp/vault.zip":
		ensure 		=> present,
		extract 	=> true,
		extract_path	=> $::vault::destination_dir,
		source 		=> $::vault::download_url,
#		checksum_type	=> sha256
#		checksum_url	=>
#		sjekke file integritet
#		sjekke signatur?
		creates		=> "${::vault::destination_dir}/vault",
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
