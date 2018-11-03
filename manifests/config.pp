# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::config
class vault::config {

	file { '/opt/vault/data':
		ensure => 'directory',
	}

	file { '/opt/vault/vault.json':
		ensure	=> file,
		content	=> to_json($::vault::vault_config),
		owner	=> 'root',
		group	=> 'root',
	}	
	include systemd::systemctl::daemon_reload
	file { '/etc/systemd/system/vault.service':
	  ensure 	=> present,
	  owner  	=> 'root',
	  group  	=> 'root',
	  mode   	=> '0644',
	  content	=> template('vault/vault.systemd.erb'),
	}
	~> Class['systemd::systemctl::daemon_reload']

}
