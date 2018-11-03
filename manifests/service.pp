# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::service

class vault::service {
	case $::vault::kernel {
		'linux': {
			service { 'vault': 
				name		=> vault,
				ensure		=> running,
				enable		=> true,
				provider	=> $::vault::provider,
				subscribe	=> File["${::vault::service_path}vault.service"],
			}	
		}
		'windows': {
			service { 'vault':
				name	=> vault,
				start => "${::vault::destination_dir}vault server -config=${::vault::destination_dir}vault.json",
				ensure	=> running,
				enable	=> true,
			}
		}
		default: { fail("Failed to start vault") }
	}
}
