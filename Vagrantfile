Vagrant.configure("2") do |config|

   config.vm.define "vagrant" do |vagrant|
    vagrant.vm.box = "centos/7"
    vagrant.vm.boot_timeout = 600
    vagrant.vm.network "private_network", ip: "192.168.56.23"
    vagrant.ssh.insert_key = false
    vagrant.vm.synced_folder ".", "/vagrant", disabled: true
    vagrant.vm.provider "virtualbox" do |vb|
    	vb.memory = "512"
	vb.cpus = "1"
	vb.name = "vagrant"
    end 
  end
  
end 
