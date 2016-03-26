# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.synced_folder '.', '/vagrant/'
  config.vm.network 'private_network', ip: '192.168.33.10'
  config.vm.provider('virtualbox'){ |vb| vb.memory = '2048' }

  config.ssh.insert_key = false

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'provisioning/playbook.yml'
  end
end
