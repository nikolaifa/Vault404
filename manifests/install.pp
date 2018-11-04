# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::install

class vault::install {
	file { $::vault::destination_dir:
		ensure => 'directory',
		owner  	=> 'vault',
		group  	=> 'vault',
		mode   	=> '0640',
	}

	archive { "${::vault::destination_dir}vault.zip":
		ensure 		=> present,
		extract 	=> true,
		extract_path	=> $::vault::destination_dir,
		source 		=> $::vault::download_url,
		creates		=> "${::vault::destination_dir}vault",
		cleanup		=> true,
		before		=> File['vault_binary'],
	}

	file { 'vault_binary':
		path => "${::vault::destination_dir}vault",
		owner => 'vault',
		group => 'vault',
		mode => '0755',
	}
	
	group { 'vault':
		ensure => present,
	}

	user { 'vault':
		ensure => 'present',
		comment => 'For running vault',
		system => true,
		home => '/etc/vault.d',
		shell => '/bin/false',
	}
}

