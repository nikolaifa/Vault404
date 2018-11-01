# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault::config
include systemd::systemctl::daemon_reload

class vault::config {
#	$backend 	= { 'file' => { 'path' => '/opt/vault' }}
#	$listener = { 'tcp' => { 'address' => '127.0.0.1:500',
#				 'tls_disable' => 1,
#			},
#	}
	file { '/etc/systemd/system/vault.service':
	  ensure 	=> present,
	  owner  	=> 'root',
	  group  	=> 'root',
	  mode   	=> '0644',
	  content	=> template('Vault404/vault.systemd.erb'),
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
