class { 'r10k':
    sources => {
        'puppet' => {
            'remote' => 'git@github.com:nikolaifa/Vault404.git',
            'basedir' => "/etc/puppetlabs/code/enviroments",
            'prefix' => false,
        },
    },
}
