node database {

  # HINT: Use a more secure password here.
  $postgres_password = 'password'

  # Manage packages with apt (required on Debian/Ubuntu systems by
  # manage_package_repo option of postgresql::globals class)
  class { 'apt':
    always_apt_update   => true,
  }

  # Forcibly activate the en_US.UTF-8 locale. Needed to have
  # UTF8 encoding in PostgreSQL databases.
  file { '/etc/default/locale':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    content => "LANG=en_US.UTF-8\n",
  } ->

  # Install PostgreSQL 9.3 server from the PGDG repository
  class { 'postgresql::globals':
    version             => '9.3',
    manage_package_repo => true,
    encoding            => 'UTF8',
    locale              => 'en_US.utf8',
  } ->
  class { 'postgresql::server':
    ensure                     => 'present',
    listen_addresses           => '*',
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ip_mask_allow_all_users    => '0.0.0.0/0',
    postgres_password          => $postgres_password,
  }

  # Install contrib modules
  class { 'postgresql::server::contrib':
    package_ensure => 'present',
  }

}
