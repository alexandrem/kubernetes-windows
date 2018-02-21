#!/bin/bash -e

user=$1
key=$2
virsh_domain=$3
local_folder=$4
remote_folder=${5:-"c:\\k\\"}

if [[ -d .vagrant/machines/default/libvirt ]]; then
    ip=$(sudo virsh domifaddr ${virsh_domain} vnet0 | grep vnet0 | awk '{print $4}' | cut -d/ -f1)
    port="22"
else
    ip="127.0.0.1"
    port="2222"
fi

scp -i ${key} -P ${port} -r ${local_folder}/* ${user}@${ip}:${remote_folder}
