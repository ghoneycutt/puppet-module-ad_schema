# == Define: ad_schema::ou
#
# Manage OU's in the schema for Active Directory
#
define ad_schema::ou () {

  include ad_schema

  exec { "ensure OU ${name}":
    command => "dsadd ou ${name}",
    unless  => "dsquery ou ${name}",
    path    => $ad_schema::exec_path,
  }
}
