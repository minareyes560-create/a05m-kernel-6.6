- name: Empaquetar con AnyKernel3 para TWRP (Samsung A05 corregido)
        run: |
          # Clonar AnyKernel3 oficial
          git clone https://github.com/osm0sis/AnyKernel3.git AK3
          
          # Buscar la imagen compilada
          IMAGE_PATH=$(find kernel-6.6/out/ -name "Image" | head -n 1)
          if [ -z "$IMAGE_PATH" ]; then
            IMAGE_PATH=$(find . -name "Image" | head -n 1)
          fi
          
          if [ -z "$IMAGE_PATH" ]; then
            echo "Error: No se encontró la imagen Image compilada."
            exit 1
          fi
          
          # Copiar el Kernel con el nombre exacto que AnyKernel espera
          cp "$IMAGE_PATH" AK3/Image
          
          cd AK3
          
          # 1. Desactivar validación estricta de nombres y verificación de parches
          sed -i 's/do.devicecheck=.*/do.devicecheck=0/g' anykernel.sh
          sed -i 's/do.modules=.*/do.modules=0/g' anykernel.sh
          sed -i 's/do.systemless=.*/do.systemless=1/g' anykernel.sh
          sed -i 's/do.cleanup=.*/do.cleanup=1/g' anykernel.sh
          
          # 2. Asignar rutas de bloques exactas para MediaTek Samsung (SM-A055M)
          sed -i 's|block=.*;|block=/dev/block/by-name/boot;|g' anykernel.sh
          sed -i 's/is_slot_device=.*/is_slot_device=0/g' anykernel.sh
          sed -i 's/ramdisk_compression=.*/ramdisk_compression=auto/g' anykernel.sh
          
          # 3. Forzar el uso de magiskboot para desempaquetar la cabecera Samsung
          sed -i 's/patch_cmdline=.*/patch_cmdline=""/g' anykernel.sh
          
          # Crear el ZIP listo para TWRP
          zip -r9 ../Kernel-A05-Panda-MonitorMode.zip * -x .git README.md *placeholder
