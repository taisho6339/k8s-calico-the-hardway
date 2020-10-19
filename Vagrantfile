Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provider "virtualbox" do |vbox|
    vbox.cpus = 2
  end

  config.vm.define 'master' do |c|
    c.vm.hostname = 'master'
    c.vm.network "private_network", ip: "192.168.254.10"
#     c.vm.provision "shell", path: "./scripts/bootstrap-master.sh"
    c.vm.provision "file", source: "./scripts", destination: "/home/vagrant/scripts"
  end

  config.vm.define 'worker-1' do |c|
    c.vm.hostname = 'worker-1'
    c.vm.network "private_network", ip: "192.168.254.11"
#     c.vm.provision "shell", path: "./scripts/bootstrap-worker.sh"
    c.vm.provision "file", source: "./scripts", destination: "/home/vagrant/scripts"
  end

  config.vm.define 'worker-2' do |c|
    c.vm.hostname = 'worker-2'
    c.vm.network "private_network", ip: "192.168.254.12"
#     c.vm.provision "shell", path: "./scripts/bootstrap-worker.sh"
    c.vm.provision "file", source: "./scripts", destination: "/home/vagrant/scripts"
  end

  config.vm.define 'worker-3' do |c|
    c.vm.hostname = 'worker-3'
    c.vm.network "private_network", ip: "192.168.254.13"
#     c.vm.provision "shell", path: "./scripts/bootstrap-worker.sh"
    c.vm.provision "file", source: "./scripts", destination: "/home/vagrant/scripts"
  end
end