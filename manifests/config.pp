# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::config
class vault::config {
#	$backend 	= { 'file' => { 'path' => '/opt/vault' }}
#	$listener = { 'tcp' => { 'address' => '127.0.0.1:500',
#				 'tls_disable' => 1,
#			},
#	}
#
	$vault_config = {
		'listener'		=> {
			'tcp' => {
				'address' => '127.0.0.1:8200',
				'tls_disable' => 1,
			}
		},
		'storage'		=> {
			'file' => {
				'path' => '/opt/vaultData'
			}
		},
#		'api_addr'		=> 'http://10.212.137.152:8200'
		'max_lease_ttl'		=> '10h',
		'default_lease_ttl'	=> '10h',
		'ui'			=> 'true',
	}
	include stdlib
	file { '/opt/vaultConf.json':
		ensure	=> file,
		content	=> to_json($vault_config),
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

	service {'vault':
	  ensure    => 'running',
	  subscribe => File['/etc/systemd/system/vault.service'],
	}
}

#class vault::config {
#	file { '/etc/systemd/system/vault.service':
#		ensure	=> present,
#		owner	=> 'root',
#		group	=> 'root',
#		mode	=> '0644',
#		content	=> template(),
#	}~>
#	exec { 'vault-systemd-reload':
#		command		=> 'systemctl daemon-reload',
#		path		=> 'bin:/usr/bin:/sbin/:/usr/sbin',
#		refreshonly	=> true,
#	}
