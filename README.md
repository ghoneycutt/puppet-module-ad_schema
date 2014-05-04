# puppet-module-ad_schema
===

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-ad_schema.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-ad_schema)

Manage schema for Active Directory on Domain Controllers.

===

# Compatibility
---------------
This module is built for use with Puppet v3 with Ruby versions 1.8.7, 1.9.3, and 2.0.0 on the following systems.

* Windows 2008R2

===

# Known Issues
--------------
Ruby 1.8.7 does not keep the hash in order, so deeper levels of OU's might be tried  out of order and fail, thus requiring multiple puppet runs to ensure consistency. The code should parse each level of the schema and recursively ensure it exists.

===

# Parameters
------------

exec_path
---------
Path for exec resources

- *Default*: 'C:\windows\sysnative'

ous
---
Hash of defined resource type `ad_schema::ou`.

- *Default*: undef

ous_hiera_merge
---------------
Boolean to control merges of all found instances of ad_schema::ous in Hiera. This is useful for specifying ad_schema::ou resources at different levels of the hierarchy and having them all included in the catalog.

- *Default*: true

===

# Hiera example

<pre>
ad_schema::ous:
  'ou=bar,dc=domain,dc=tld':
    name: 'ou=bar,dc=domain,dc=tld'
  'ou=foo,ou=bar,dc=domain,dc=tld':
    name: 'ou=foo,ou=bar,dc=domain,dc=tld'
</pre>
