# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault::params
class vault::params {

	$base_url = 'https://releases.hashicorp.com/vault'
	$version = '0.11.4'
	$service_path = '/etc/systemd/system/'
	case $facts['architecture'] {
		'i386': { $processor = '386' }
		'amd64': { $processor = 'amd64' }
		'arm': { $processor = 'arm' }
		default: { fail("Unsupported architecture: ${facts['architecture']}") }
	}
	case $facts['kernel'] {
		'Linux': { 
			$kernel = 'linux' 
			$provider = 'systemd'
			$destination_dir = '/opt/vault/'
		}
		'Windows': { 
			$destination_dir = 'c:/vault/'
			$kernel = 'windows' 
			$provider = 'windows'
		}
		default: { fail("Unsupported kernel: ${facts['kernel']}") }
	}
	
	$vault_config = {
		'listener'		=> {
			'tcp' => {
				'address' => '127.0.0.1:8200',
				'tls_disable' => 1,
			}
		},
		'storage'		=> {
			'file' => {
				'path' => "${destination_dir}data"
			}
		},
#		'api_addr'		=> 'http://10.212.137.152:8200'
		'max_lease_ttl'		=> '10h',
		'default_lease_ttl'	=> '10h',
		'ui'			=> 'true',
	}
 }
