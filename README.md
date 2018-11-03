
# vault

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with vault](#setup)
    * [What vault affects](#what-vault-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vault](#beginning-with-vault)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Vault404 installs and starts runs [Vault](https://www.vaultproject.io/) secret engine server.

## Setup

### What vault affects **OPTIONAL**

* Files, folders and services all created by vault
* Service/configuration for vault
* User and group for running vault 

### Setup Requirements

puppetlabs-stdlib
puppet-archive
camptocamp-systemd
camptocamp-openssl

### Beginning with vault

Declare the vault class:
```puppet
  include 'vault'
``` 
## Limitations

Outside of vault limitations, its' probably limited to OS's with linux kernel and using systemd as a service manager. Tested with Ubuntu 18.04 and puppet 5.4.0

## Development
We are happy to recieve commits as long as they follow the rules and guidelines below. If you want to fork the module somewhere else this is also fine as long as you mention or link the original module along with the documentation and code.

Rules:

* All code must follow the [Puppet Style Guide](https://docs.puppet.com/guides/style_guide.html).
* Added code must pass the included tests. If you add new fuctions, please create puppet tests for these.
* Make sure not to break any existing code or functions of this module.
* New functions must be documented in the Github repository.
* All commits must follow the [Github Commit Guide](https://github.com/erlang/otp/wiki/writing-good-commit-messages).

Guide:

1. Fork the repo.
2. Run the tests to verify that the module works as intended.
3. Add new code, bugfixes and documentation if needed.
4. Make sure that all the tests pass.
5. Push to your fork and submit a pull request.
6. Create an issue on Github if you have any problems.
