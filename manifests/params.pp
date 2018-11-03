# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault::params
class vault::params {

	$base_url		='https://releases.hashicorp.com/vault'
	$version		='0.11.4'
	#$download_url		='${base_url}/${version}/vault_${version}_${os_tmp}_${processor}.zip'
#	$server_url		='http://127.0.0.1:8200'
	$destination_dir	='/opt/vault/'
	$binary_dir		='/opt/bin'
#	$config_dir		='/etc/puppetlabs/code/environments/production/modules/vault'
#
	case $facts['architecture'] {
		'i386': { $processor = '386' }
		'amd64': { $processor = 'amd64' }
		'arm': { $processor = 'arm' }
		default: { fail("Unsupported kernel ${facts['architecture']}") }
	}
	case $facts['kernel'] {
		'Linux': { 
			$kernel = 'linux' 
			$provider = 'systemd'
		}
		'Windows': { 
			$kernel = 'windows' 
			$provider = 'windows'
		}
		'darwin': { $os = 'darwin' }
		'freebsd': { $os = 'freebsd' }
		'netbsd': { $os = 'netbsd' }
		'openbsd': { $os = 'openbsd' }
		'solaris': { $os = 'solaris' }
		default: { fail("Unsupported ${facts['kernel']}") }
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
				'path' => '/opt/vault/data'
			}
		},
#		'api_addr'		=> 'http://10.212.137.152:8200'
		'max_lease_ttl'		=> '10h',
		'default_lease_ttl'	=> '10h',
		'ui'			=> 'true',
	}
 }
