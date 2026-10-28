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

# Configuración de partición para Samsung A05
block=/dev/block/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=0;

# Cargar funciones base de AnyKernel
. tools/ak3-core.sh;

# Inicio del proceso de extracción y flasheo seguro
ui_print "Extrayendo partición de arranque del dispositivo...";
dd if=$block of=$home/boot.img;

ui_print "Buscando y descomprimiendo el ramdisk original...";
if [ -f "boot.img" ]; then
  # Forzar la extracción del ramdisk para que AnyKernel3 lo reconozca
  unpack_boot;
else
  ui_print "Error: No se pudo generar la imagen base del boot.";
  exit 1;
fi

# Escribir el nuevo kernel con el ramdisk ya localizado e integrado
write_boot;
