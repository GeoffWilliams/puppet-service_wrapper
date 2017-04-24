# Wraps services and provides init.d scripts
define service_wrapper (
  $service_name     = $title,
  $user             = 'root',
  $description      = $title,
  $pre_command      = '',
  $command          = undef,
  $daemon_pid_file  = undef,
  $start_priority   = 94,
  $kill_priority    = 4
) {
  include service_wrapper::params
  case $daemon_pid_file {
    undef: {
      $manage_pid_file = true
      $pid_file = "/var/run/${service_name}.pid"
    }
    default: {
      $manage_pid_file = false
      $pid_file = $daemon_pid_file
    }
  }

  $log_filename = "/var/log/${title}.log"

  file { "/etc/init.d/${service_name}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/${service_wrapper::params::template}");
  }
}
