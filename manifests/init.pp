# == Class: ad_schema
#
# Module to manage ad_schema
#
class ad_schema (
  $exec_path       = 'C:\windows\sysnative',
  $ous             = undef,
  $ous_hiera_merge = true,
) {

  require 'windows_domain_controller'

  validate_absolute_path($exec_path)

  if type($ous_hiera_merge) == 'string' {
    $ous_hiera_merge_real = str2bool($ous_hiera_merge)
  } else {
    $ous_hiera_merge_real = $ous_hiera_merge
  }
  validate_bool($ous_hiera_merge_real)

  if $ous != undef {
    if $ous_hiera_merge_real == true {
      $ous_real = hiera_hash('ad_schema::ous')
    } else {
      $ous_real = $ous
    }
    validate_hash($ous_real)
    create_resources('ad_schema::ou',$ous_real)
  }
}
