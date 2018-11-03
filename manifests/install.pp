# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::install
include '::archive'

class vault::install {

	file { $::vault::destination_dir:
		ensure => 'directory',
		owner  	=> 'vault',
		group  	=> 'vault',
		mode   	=> '0644',
	}

	archive { $::vault::destination_dir:
		ensure 		=> present,
		extract 	=> true,
		extract_path	=> $::vault::destination_dir,
		source 		=> $::vault::download_url,
		creates		=> "${::vault::destination_dir}$vault_bin",
		cleanup		=> true,
		before		=> File['vault_binary'],
	}

	file { 'vault_binary':
		path => "${::vault::destination_dir}$vault_bin",
		owner => 'vault',
		group => 'vault',
		mode => '0755',
	}
	user { 'vault':
		ensure => 'present',
		comment => 'For running vault',
		system => true,
		home => '/etc/vauld.d',
		shell => '/bin/false',
	}
}

