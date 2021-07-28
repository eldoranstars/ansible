Vagrant.configure("2") do |config|

   config.vm.define "vagrant" do |vagrant|
    vagrant.vm.box = "jasonc/centos7-32bit"
    vagrant.vm.boot_timeout = 360
    vagrant.vm.network "public_network", bridge: "enp0s3", ip: "192.168.1.44"
    vagrant.ssh.insert_key = false
    vagrant.vm.synced_folder ".", "/vagrant", disabled: true
    vagrant.vm.provider "virtualbox" do |vb|
    	vb.memory = "512"
	vb.cpus = "1"
	vb.name = "vagrant"
    end 
  end
  
end 
