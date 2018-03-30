# etc_profile

[![Build Status](https://travis-ci.org/ccin2p3/puppet-etc_profile.png?branch=master)](https://travis-ci.org/ccin2p3/puppet-etc_profile)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with etc_profile](#setup)
    * [What etc_profile affects](#what-etc_profile-affects)
    * [Synopsis](#synopsis)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages the Bourne and C shell system login profiles.
It does not overwrite existing profiles handled by the OS.

## Setup

### What etc_profile affects

Complete list of resources managed by this module:

#### RedHat OS families

* `File['/etc/profile.d/site.sh']`
* `File['/etc/profile.d/site.csh']`
* `File['/etc/profile.d/site']` (purged)
* `File['/etc/profile.d/site/*.sh']`
* `File['/etc/profile.d/site/*.csh']`

#### Debian OS families

* `File['/etc/profile.d/site.sh']`
* `File['/etc/profile.d/site']` (purged)
* `File['/etc/profile.d/site/*.sh']`
* `File['/etc/csh/login.d/site.csh']`
* `File['/etc/csh/login.d/site']` (purged)
* `File['/etc/csh/login.d/site/*.csh']`

### Synopsis

```puppet
site_profile::entry {'oracle':
  config => {
    content => 'export ORACLE_HOME=/usr/local/oracle/product/instantclient/11.2.0.3',
  }
}
```

```puppet
site_profile::entry {'openstack':
  config => {
    content => epp('site_openstack/template/system_profile.epp'),
  }
}
```

## Usage

## Reference

### Classes `etc_profile::sh` and `etc_profile::csh`

These are **usually never called on their own**, as tehy only set up the requirements for `site_profile::entry`'s.
The **only reason to call them** is to **change the OS defaults**. It is preferred to open an issue if your OS isn't supported, and we'll add it to the module's [data](data).

### Defined Type `site_profile::entry`

This is the main resource you'll be using to add new profile entries.
A profile entry is merely a Bourne or C shell script that will be added to system profiles.

#### Parameters

* `name` String (Alphanum, Namevar) name of the resource
* `config` Hash to add additional `File` parameters, *e.g.* `mode`
* `type` Enum[sh|csh] script type

#### Examples

See [Synopsis](#synopsis).

## Limitations

Currently only supports RedHat and Debian OS families.

## Development

For issues, merge requests, please use the project's [github page](https://git.io/puppet-etc_profile)

