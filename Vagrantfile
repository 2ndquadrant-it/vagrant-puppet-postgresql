# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # vagrant-cachier configuration
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.auto_detect = true
  end

  config.vm.define "database" do |cfg|
    cfg.vm.hostname = "database"

    # Create a forwarded port mapping which allows access the
    # PostgreSQL instance within the machine from the 5432 port on the
    # host machine. If you already have a running Postgres on the host
    # system you need to change the "host" value to point to a free
    # port number
    cfg.vm.network :forwarded_port, guest: 5432, host: 5432

    # Provision the guest with Puppet stand alone. The actual
    # configuration is contained in manifests/site.pp file
    cfg.vm.provision :puppet do |puppet|
      puppet.module_path    = "modules"
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
    end
  end

end
