# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


  (1..4).each do |i|
    config.vm.define "bee#{i}" do |node|
      node.vm.box = "centos/7"
      node.vm.hostname = "bee#{i}"
      node.vm.network :private_network, ip: "10.125.0.1#{i}"
      
      node.vm.provision "shell", inline: <<-SHELL
        sed -i '/PubkeyAuthentication/c\PubkeyAuthentication yes ' /etc/ssh/sshd_config    
        sed -i '/PermitRootLogin/c\PermitRootLogin yes ' /etc/ssh/sshd_config    
        sed -i '/PasswordAuthentication/c\PasswordAuthentication yes ' /etc/ssh/sshd_config    
        systemctl restart sshd
      SHELL
       
    end
  end

end
