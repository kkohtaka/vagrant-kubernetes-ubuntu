# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

$k8s_token = "49c8b3.9091d24b7ba5a046"
$k8s_version = "v1.4.5"

$master_ip = "172.17.8.10"
$worker_ip = "172.17.8.20"

Vagrant.configure("2") do |config|
  config.vm.box = "kubernetes"
  config.vm.box_url = "./kubernetes-virtualbox.box"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 1
  end

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: $master_ip
  end

  config.vm.define "worker" do |worker|
    worker.vm.hostname = "worker"
    worker.vm.network "private_network", ip: $worker_ip
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/cluster.yml"
    ansible.groups = {
      master: ["master"],
      worker: ["worker"],
    }
    ansible.extra_vars = {
      k8s_token: $k8s_token,
      k8s_version: $k8s_version,
      master_ip: $master_ip,
    }
  end
end
