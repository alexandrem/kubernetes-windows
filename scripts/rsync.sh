#!/bin/bash

user=$1
key=$2
local_folder=$3
remote_folder=${4:-"c:\\k\\"}

if [[ -d .vagrant/machines/default/libvirt ]]; then
    ip=$(sudo virsh domifaddr $(DOMAIN) vnet0 | grep vnet0 | awk '{print $$4}' | cut -d/ -f1)
    port="22"
else
    ip="127.0.0.1"
    port="2222"
fi

scp -i ${key} -P ${port} -r ${local_folder}/* ${user}@${ip}:${remote_folder}
