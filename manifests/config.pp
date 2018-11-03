# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::config
class vault::config {

	file { "${::vault::destination_dir}data":
		ensure => 'directory',
	}

	file { "${::vault::destination_dir}vault.json":
		ensure	=> file,
		content	=> to_json($::vault::vault_config),
	}	
	
	file { "${::vault::service_path}vault.service":
	  ensure 	=> present,
	  owner  	=> 'root',
	  group  	=> 'root',
	  mode   	=> '0644',
	  content	=> template('vault/vault.systemd.erb'),
	}
	~> Class['systemd::systemctl::daemon_reload']

}
