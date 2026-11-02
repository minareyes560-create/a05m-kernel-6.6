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

# Inicio del proceso de instalación seguro
ui_print "Iniciando instalación del Kernel Personalizado para Samsung A05...";

# Verificar si el boot.img base está presente en el paquete ZIP
if [ -f "$home/boot.img" ]; then
  ui_print "Descomprimiendo el ramdisk y preparando la imagen...";
  unpack_boot;
else
  ui_print "Error crítico: No se encontró el archivo boot.img en el paquete.";
  exit 1;
fi

# Escribir el nuevo kernel integrado con el ramdisk del dispositivo
ui_print "Flashando el nuevo kernel en la partición de arranque...";
write_boot;

ui_print "¡Instalación completada con éxito!";
