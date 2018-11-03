# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::service

class vault::service {
	service { 'vault': 
		name		=> vault,
		ensure		=> running,
		enable		=> true,
		provider	=> systemd,
		subscribe	=> File["${::vault::service_path}vault.service"],
	}
}
