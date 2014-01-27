# PostgreSQL database server whenever you need one (with puppet)

## Dependencies

You'll need to have the following tools installed for this to work

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://vagrantup.com/)
* [Ruby](https://www.ruby-lang.org)

## Instructions

This repo contains everything necessary to stand up a local instance
of an Ubuntu 12.04 server running PostgreSQL.

All commands below have to be executed in the project directory.

Install bundler if you don't have it:

    gem install bundler

Install librarian-puppet using bundler:

    bundle install

Install all the required puppet modules using librarian-puppet:

    bundle exec librarian-puppet install --verbose

To get the server going execute the following:

    vagrant up

To shutdown the database server do the following:

    vagrant halt

To destroy the database server do the following (this will remove all data):

    vagrant destroy

Then you should be able to connet to the database server using the
username *postgres* and password *password* on local 5432 port.

Assuming you have the PostgreSQL client on your host operating system you can
connect from a terminal with the following command:

    psql -h localhost -U postgres --password
    enter password: password

Beware that this configuration must be used in a development scenario
only. We suggest that you look at the PostgreSQL documentation for
safer and more secure authentication mechanisms. We have used the
[puppetlabs/postgresql](https://forge.puppetlabs.com/puppetlabs/postgresql)
module for PostgreSQL configuration management: you are encouraged to
read the documentation for more detailed information on how to
customise your Postgres environment.

## Troubleshooting

This vagrant box takes port 5432 so if you have processes listening on
those ports then things might not work.

## Acknowledgements

Thanks to @scottmuc from his work on
[vagrant-postgresql](https://github.com/scottmuc/vagrant-postgresql).
This project takes inspiration from his code.
