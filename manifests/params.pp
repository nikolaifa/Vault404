# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include vault::params
class vault::params {

	$base_url			='https://releases.hashicorp.com/vault'
	$version			='0.11.4'
	$os_tmp				='linux'
	$processor			='amd64'
	$download_url			='${base_url}/${version}/vault_${version}_${os_tmp}_${processor}.zip'
	
	case $facts['architecture'] {
		'i386': { $processor = '386' }
		/'amd64|x85_64'/: { $processor = 'amd64' }
		'arm': { $processor = 'arm' }
#		default: { fail("Unsupported kernel ${facts['architecture']}") }
	}
	case $facts['kernel'] {
		'Linux': { 
			$os = 'linux' 
			$provider = 'systemd'
		}
		'windows': { 
			$os = 'windows' 
			$provider = 'windows'
		}
		'darwin': { $os = 'darwin' }
		'freebsd': { $os = 'freebsd' }
		'netbsd': { $os = 'netbsd' }
		'openbsd': { $os = 'openbsd' }
		'solaris': { $os = 'solaris' }
#		default: { fail("Unsupported ${facts['kernel']}") }
	}
 }
