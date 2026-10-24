# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

properties() { '
kernel.string=Kernel Custom A05 - Panda Monitor Mode
do.devicecheck=0
do.modules=0
do.systemless=1
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
'; }

BLOCK=/dev/block/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;
NO_MAGISK_CHECK=1;

. tools/ak3-core.sh;

ui_print " " " -> Flasheador de Kernel Custom A05 (Modo Monitor)..."

split_boot;

if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk;
    write_boot;
else
    flash_boot;
fi;
