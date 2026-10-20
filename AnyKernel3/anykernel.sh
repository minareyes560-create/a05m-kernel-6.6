### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Samsung A05 Custom Kernel 6.6 (Theman-Fromfar)
do.devicecheck=0
do.modules=1
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=a05
device.name2=a05m
device.name3=SM-A055M
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot shell variables
block=/dev/block/mmcblk0p35;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

ui_print " " "  -> Flashing custom kernel for Samsung A05"

# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi
## end boot install
