# puppet module install puppetlabs-ruby
#/vagrant/puppet/modules

node 'vagrant-ubuntu-raring-32' { # [1] 
 
    #https://forge.puppetlabs.com/puppetlabs/ruby
	class { 'ruby':
	  gems_version    => 'latest',
	}

	
}