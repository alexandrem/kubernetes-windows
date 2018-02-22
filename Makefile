
.PHONY: libvirt-setup
libvirt-setup:
	sudo virsh net-define conf/libvirt/vagrant-libvirt-k8s.xml
	sudo virsh net-start vagrant-libvirt-k8s

setup: libvirt-setup
