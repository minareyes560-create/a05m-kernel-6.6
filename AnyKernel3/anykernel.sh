# Definición de propiedades para AnyKernel3
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
is_slot_device=0;
ramdisk_compression=lz4;
patch_vbmeta_flag=0;

# Cargar funciones de AnyKernel
. tools/ak3-core.sh;

# Flasheo directo de la imagen ya preparada con el kernel y drivers integrados
if [ -f "$home/boot-final.img" ]; then
  ui_print "Flaseando boot-final.img optimizado...";
  dd if=$home/boot-final.img of=$block;
else
  ui_print "Aviso: boot-final.img no encontrado, usando método estándar...";
  dump_boot;
  write_boot;
fi
