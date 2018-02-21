DOMAIN ?=

VAGRANT_KEY = ~/.vagrant.d/insecure_private_key
SSH_CONFIG ?= ~/.ssh/config
LIBVIRT_IPAM ?= 192.168.121.*
LOCAL_K8S_DEV := ../scripts/k8s

define ssh_libvirt

# vagrant libvirt powershell
Host $(LIBVIRT_IPAM)
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
endef

export ssh_libvirt

.PHONY: up
up:
	vagrant up --provider libvirt

.PHONY: destroy
destroy:
	vagrant destroy -f

.PHONY: ssh_config_libvirt
ssh_config_libvirt:
	@egrep "^# vagrant libvirt powershell" $(SSH_CONFIG) &>/dev/null || echo "$$ssh_libvirt" >> $(SSH_CONFIG)

.PHONY: pwsh-enter
pwsh-enter: ssh_config_libvirt
	# Copy the enter-pssession command in your pwsh terminal
	@ip=$$(sudo virsh domifaddr $(DOMAIN) vnet0 | grep vnet0 | awk '{print $$4}' | cut -d/ -f1); \
	echo "enter-pssession -Hostname $$ip -Username vagrant -KeyFilePath $(VAGRANT_KEY)"; \
	TERM=xterm pwsh

.PHONY: test
sync-dev:
	$(shell ../scripts/rsync.sh vagrant $(VAGRANT_KEY) $(DOMAIN) $(LOCAL_K8S_DEV))
	@true
