# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

VAGRANT_BOX=kubernetes-virtualbox.box

box:
	-vagrant box add \
		--provider virtualbox \
		--box-version 2.0.19 \
		boxcutter/ubuntu1610

build: $(VAGRANT_BOX)

$(VAGRANT_BOX): packer.json
	packer build \
		$<

run: $(VAGRANT_BOX) stop Vagrantfile
	vagrant up

stop:
	vagrant destroy --force
