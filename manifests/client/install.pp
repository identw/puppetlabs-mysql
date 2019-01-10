# @summary
#   Private class for MySQL client install.
#
# @api private
#
class mysql::client::install {

  if $mysql::client::package_manage {
    ensure_packages('mysql_client', {
      ensure          => $mysql::client::package_ensure,
      install_options => $mysql::client::install_options,
      name            => $mysql::client::package_name,
    })
    # package { 'mysql_client':
    #   ensure          => $mysql::client::package_ensure,
    #   install_options => $mysql::client::install_options,
    #   name            => $mysql::client::package_name,
    # }

  }

}
