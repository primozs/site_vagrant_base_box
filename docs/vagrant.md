VAGRANT
======

* [http://docs.vagrantup.com/v2/](http://docs.vagrantup.com/v2/)

* [http://www.vagrantup.com/](http://www.vagrantup.com/)

* [http://www.linux.com/news/software/applications/694157-setup-your-dev-environment-in-nothing-flat-with-puppet](http://www.linux.com/news/software/applications/694157-setup-your-dev-environment-in-nothing-flat-with-puppet)

* [http://www.linux.com/learn/tutorials/696255-jumpstart-your-linux-development-environment-with-puppet-and-vagrant](http://www.linux.com/learn/tutorials/696255-jumpstart-your-linux-development-environment-with-puppet-and-vagrant)


Add a reusable box between many projects:
-----------------------------------------
	vagrant box add precise32 http://files.vagrantup.com/precise32.box
	vagrant box add precise64 http://files.vagrantup.com/precise64.box

Create new project from box - download box if not exist
-------------------------------------------------------
	vagrant init precise64 http://files.vagrantup.com/precise64.box

Create empty project:
---------------------
	$ mkdir somedir; cd somedir
	$ vagrent init

Using a box:
------------
	Change configuration in Vagrant file

	Vagrant.configure("2") do |config|
	  config.vm.box = "precise32"
	end

Boot - run machine
------------------
	$ vagrant up


SSH to vagrant machine
----------------------
	$ vagrant ssh

Status of machine
-----------------
	$ vagrant status

Destroy
-------
	$ vagrant destroy


Reload machine
--------------
	$ vagrant reload

Suspend machine
---------------
	$ vagrant suspend 


CREATE VAGRANT BASE BOX
=======================
1. Create Virtualbox 512mb, 9gb Disk Dinymic, disable sound and usb, network nat and hostonly, 
sshd, user:vagrant/vagrant,	dissable grub, public private keys for vagrant https://github.com/mitchellh/vagrant/tree/master/keys/

	wget http://github.com/mitchellh/vagrant/raw/master/keys/vagrant
	wget http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub


2. temp network
	ifconfig eth1 192.168.56.2 or 3 or whatever

3. ssh and Install puppet agent

	$ wget http://apt.puppetlabs.com/puppetlabs-release-quantal.deb
	$ wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
	$ wget http://apt.puppetlabs.com/puppetlabs-release-lucid.deb
	
	$ sudo dpkg -i puppetlabs-release-quantal.deb
	$ sudo dpkg -i puppetlabs-release-precise.deb
	$ sudo dpkg -i puppetlabs-release-lucid.deb
	
	$ sudo apt-get update
	$ sudo apt-get install puppet
	$ rm puppetlabs-release-precise.deb 

4. Copy files to virtual box and set /etc/puppet/puppet.conf moules setting
	modulepath=$confdir/modules:/home/vagrant/puppet/modules
	
	local to remote
	rsync -r --delete ./site_vagrant_base_box/ vagrant@192.168.56.11:~/puppet/
	
	copy vagrant manifest to puppet on remote machine
	sudo rsync -r --delete /home/vagrant/puppet/ /etc/puppet/
	
4. run puppet vagrant init	
	sudo puppet apply /etc/puppet/manifests/vagrant.pp
	
5. edit /etc/ssh/sshd_config and set UseDNS to no
	 
Package and Distribute
======================
on host go to virtual box dir ex: 

	$ cd ~/VirtualBox\ VMs/vb_base_precise64_512mb/
	$ vagrant package --base vb_base_precise64_512mb

	add vritual box
	$ vagrant box add pgc_precise64 /Users/primozsusa/VirtualBox\ VMs/vb_base_precise64_512mb/package.box

	remove virtualbox
	$ vagrant box remove pgc_precise64 virtualbox
	
	$ mkdir test_environment
	$ cd test_environment
	$ vagrant init pgc_precise64
	$ vagrant up
	$ vagrant ssh	 
	 
VAGRANT BOX REFERENCES
==========
* [http://www.vagrantbox.es/](http://www.vagrantbox.es/)

* [https://github.com/fespinoza/checklist_and_guides/wiki/Creating-a-vagrant-base-box-for-ubuntu-12.04-32bit-server](https://github.com/fespinoza/checklist_and_guides/wiki/Creating-a-vagrant-base-box-for-ubuntu-12.04-32bit-server)

* [http://docs-v1.vagrantup.com/v1/docs/base_boxes.html#creating_base_boxes](http://docs-v1.vagrantup.com/v1/docs/base_boxes.html#creating_base_boxes)

* [http://ingol.nl/blog/2013/03/19/ubuntu-12-04-2-server-vagrant-base-box-with-puppet-virtualbox-and-secure-ssh-key/](http://ingol.nl/blog/2013/03/19/ubuntu-12-04-2-server-vagrant-base-box-with-puppet-virtualbox-and-secure-ssh-key/)

* [http://docs.vagrantup.com/v2/virtualbox/boxes.htmlml](http://docs.vagrantup.com/v2/virtualbox/boxes.htmlml)



	