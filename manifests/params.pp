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
		/(amd64|x86_64)/: { $processor = 'amd64' }
		'arm': { $processor = 'arm' }
		default: { 
			$processor = undef
			fail("Unsupported architecture: ${facts['architecture']}") 
		}
	}
	case $facts['kernel'] {
		'Linux': { 
			$kernel = 'linux' 
			$provider = 'systemd'
			$destination_dir = '/opt/vault/'
		}
		'Windows': { 
			$kernel = 'windows' 
			$provider = 'windows'
			$destination_dir = 'c:/vault/'
		}
		default: {
			$kernel = undef
			$provider = undef
			$destination_dir = undef 
			fail("Unsupported kernel: ${facts['kernel']}") 
		}
	}
	
	$vault_config = {
		'listener'		=> {
			'tcp' => {
				'address' => '0.0.0.0:8200',
				'tls_disable' => 1,
			}
		},
		'storage'		=> {
			'file' => {
				'path' => "${destination_dir}data"
			}
		},
		'max_lease_ttl'		=> '10h',
		'default_lease_ttl'	=> '10h',
		'ui'			=> 'true',
	}
	$download_url = "${base_url}/${version}/vault_${version}_${kernel}_${processor}.zip"
 }
