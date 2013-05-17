BASE MACHING VB_BASE_PRECISE64_512
==================================

Virtual box
-----------
- ubuntu precise lts
- 64bit
- base mem 512
- puppet installed 3.3.1
- ip: 192.168.56.11 static, must not be set by default for packaging
- users: vagrant/vagrant
- users: root/vagrant
	
Copy puppet project 
-------------------	
	rsync -r --delete --exclude 'docs' ./site_vagrant_base_box/ vagrant@192.168.56.11:~/puppet/
	
Sync and apply
--------------	
	sudo rsync -r --delete /home/vagrant/puppet/ /etc/puppet/
	sudo puppet apply /etc/puppet/manifests/additions.pp
	sudo puppet apply /etc/puppet/manifests/vagrant.pp 

Package
-------
on host go to virtual box dir ex: 

	$ cd ~/VirtualBox\ VMs/vb_base_precise64_512mb/
	$ vagrant package --base vb_base_precise64_512mb

	add vritual box
	$ vagrant box add pgc_precise64 package.box

	how to remove virtualbox
	$ vagrant box remove pgc_precise64 virtualbox
	
Usage
-----	
	$ mkdir test_environment
	$ cd test_environment
	$ vagrant init pgc_precise64
	$ vagrant up
	$ vagrant ssh	 


