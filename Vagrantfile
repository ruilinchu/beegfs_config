# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


  (1..3).each do |i|
    config.vm.define "hpc-staging0#{i}" do |node|
      node.vm.box = "box-cutter/centos67"
      node.vm.hostname = "hpc-staging0#{i}"
      node.vm.network :private_network, ip: "10.125.0.6#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      #   (0..2).each do |d|
      #     vb.customize ['createhd',
      #                   '--filename', "osd-disk-#{i}-#{d}",
      #                   '--size', '4096']
      #     # Controller names are dependent on the VM being built.
      #     # It is set when the base box is made in our case box-cutter/centos71.
      #     # Be careful while changing the box.
      #     vb.customize ['storageattach', :id,
      #                   '--storagectl', 'SATA Controller',
      #                   '--port', 3 + d,
      #                   '--device', 0,
      #                   '--type', 'hdd',
      #                   '--medium', "osd-disk-#{i}-#{d}.vdi"]
      #   end
        
      end
    end
  end

end
