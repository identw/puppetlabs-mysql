# Binary log configuration requires the mysql user to be present. This must be done after package install
class mysql::server::binarylog (
  $log_dir_group = $mysql::server::log_dir_group,
  $log_dir_mode  = $mysql::server::log_dir_mode,
)
{

  $options = $mysql::server::options
  $includedir = $mysql::server::includedir

  $logbin = pick($options['mysqld']['log-bin'], $options['mysqld']['log_bin'], false)

  if $logbin {
    $logbindir = mysql_dirname($logbin)

    #Stop puppet from managing directory if just a filename/prefix is specified
    if $logbindir != '.' {
      file { $logbindir:
        ensure => directory,
        mode   => $log_dir_mode,
        owner  => $options['mysqld']['user'],
        group  => $log_dir_group,
      }
    }
  }
}
