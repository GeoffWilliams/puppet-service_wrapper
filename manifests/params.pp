# Service_wrapper::Params
#
# Params pattern for service wrapper
class service_wrapper::params {
  case $facts['os']['family'] {
    "RedHat": {
      $template = 'init.d.red_hat.erb'
    }
    "Suse": {
      $template = 'init.d.suse.erb'
    }
    default: {
      fail("Module ${module_name} is not supported on os family ${::osfamily}.")
    }
  }
}
