# AnyKernel3 Script para Samsung Galaxy A05 (SM-A055M)

properties() { '
kernel.string=Kernel Personalizado A05 - Eros Tool
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuntagged=0
device.name1=a05
device.name2=a05m
device.name3=SM-A055M
device.name4=a05mxx
supported.versions=
supported.patchlevels=
'; }

# Ruta del bloque de arranque para MediaTek (Samsung A05 / SM-A055M)
block=/dev/block/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# Cargar funciones de AnyKernel
. tools/ak3-core.sh;

# Desempaquetar e inyectar
split_boot;
flash_boot;
