#!/bin/bash
echo "checking for dependency"
sh ./ansible.sh # check for ansible
if ! command -v vagrant >/dev/null; then
	echo "vagrant not found in your system please install vagrant before running the script"

else
	echo "vagrant found on your system"
	VM_Status=`vagrant status --machine-readable | grep ",state,"  | awk -F, '{print $4}'`
	if [[ $VM_Status == *"running"* ]]; then
		echo "vagrant machine is already up and running"
	    vagrant provision 
	else
		echo "No vagrant machine found bringing a up a new machine"
	    vagrant up  
	fi

fi
