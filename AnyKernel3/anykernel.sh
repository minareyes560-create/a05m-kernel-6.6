# AnyKernel3 Setup
# begin properties
properties() { '
kernel.string=Kernel Custom A05 - Panda Monitor Mode
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanreq=0
device.name1=a05m
device.name2=SM-A055M
device.name3=a05
'; } # end properties

# shell variables
block=auto;
is_slot_device=0;
ramdisk_against_header=0;

## AnyKernel methods (insert boot partition status)
. tools/ak3-core.sh;

## AnyKernel install
split_boot;

flash_boot;
## end install
