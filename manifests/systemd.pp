# Wraps services and provides systemd scripts
define service_wrapper::systemd (
  $service_name      = $title,
  $user              = 'root',
  $description       = $title,
  $pre_command       = undef,
  $command           = undef,
  $environment       = [],
  $working_directory = '/',
  $timeout_sec       = 90,
  $restart           = 'no'
) {
  $log_filename = "/var/log/${title}.log"

  file {
    "/usr/lib/systemd/system/${service_name}.service":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0544',
      content => template("service_wrapper/systemd.suse.erb");
  }
}
