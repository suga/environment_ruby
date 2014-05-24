# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The VM name
  config.vm.hostname = "monitor"
  
  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "precise64"
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 5678, host: 9090 #resque-web 

  # Share the api folder to the guest VM, backed by NFS. 
  config.vm.synced_folder "app/", "/var/www/monitor", :nfs => true

  # We need a private network with a static ip to use NFS synced folders.
  # This is due to a limitation of VirtualBox's built-in networking
  config.vm.network :private_network, ip: "192.168.33.10"

  # Provider-specific configuration
  config.vm.provider :virtualbox do |vb|
     #vb.gui = true
     # Change memory:
     vb.customize ["modifyvm", :id, "--memory", "1048"]
  end

  # Enable provisioning with Puppet.
  #config.vm.provision :puppet do |puppet|
  #  puppet.manifests_path = "puppet/manifests"
  #  puppet.manifest_file  = "base.pp"
  #  puppet.module_path = "puppet/modules"
  #  puppet.options = [ '--verbose', '--debug' ]
  #end

  #config.vm.provision :shell, :path => "files/scripts/ruby.sh"
  #config.vm.provision :shell, :path => "files/scripts/redis.sh"
  #config.vm.provision :shell, :path => "files/scripts/mongodb.sh"
  #config.vm.provision :shell, :path => "files/scripts/bootstrap_app.sh"

end
