#!/bin/sh -e

# VirtualBox VM provisioning script
# http://github.com/ajclark/scripts/preseed/

which -s VBoxManage || exit 1

if [ -z $1 ]; then
    echo "Usage: ${0} <vm-name>"
    exit 1
fi

ISO=~/Downloads/debian-6.0.1a-i386-netinst.iso

# Create VM, set boot order
VBoxManage createvm --name ${1} --ostype Debian --register
VBoxManage modifyvm ${1} --memory 384 --boot1 dvd --cpus 1 --nic1 bridged --bridgeadapter1 "en1: AirPort" --nictype1 82540EM --cableconnected1 on

# Add hard disk
VBoxManage storagectl ${1} --name "SATA Controller" --add sata
VBoxManage createhd --filename ~/.VirtualBox/${1}_hdd.vdi --size 8192
VBoxManage storageattach ${1} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ~/.VirtualBox/${1}_hdd.vdi

# Add DVD-ROM
VBoxManage storagectl ${1} --name "IDE Controller" --add ide
VBoxManage storageattach ${1} --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium ${ISO}

# Start VM
VBoxManage startvm ${1} || VBoxManage unregistervm --delete ${1}
