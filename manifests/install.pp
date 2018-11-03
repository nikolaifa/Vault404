# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#include vault::install
include '::archive'

class vault::install {

	file { $::vault::destination_dir:
		ensure => 'directory',
	}

	archive { $::vault::destination_dir:
		ensure 		=> present,
		extract 	=> true,
		extract_path	=> $::vault::destination_dir,
		source 		=> $::vault::download_url,
		creates		=> "${::vault::destination_dir}vault",
		cleanup		=> true,
	}
}

