- name: Empaquetar con AnyKernel3 para TWRP
        run: |
          git clone https://github.com/osm0sis/AnyKernel3.git AK3
          
          IMAGE_PATH=$(find . -name "Image" -path "*/out/*" | head -n 1)
          
          if [ -z "$IMAGE_PATH" ]; then
            IMAGE_PATH=$(find out/ -name "Image" | head -n 1)
          fi
          
          if [ -z "$IMAGE_PATH" ]; then
            echo "Error: No se encontró la imagen compilada."
            exit 1
          fi
          
          cp "$IMAGE_PATH" AK3/
          
          cd AK3
          
          # Forzar propiedades de compatibilidad para evitar bloqueos en TWRP
          sed -i 's/do.devicecheck=.*/do.devicecheck=0/g' anykernel.sh
          sed -i 's/do.modules=.*/do.modules=1/g' anykernel.sh
          sed -i 's/do.systemless=.*/do.systemless=0/g' anykernel.sh
          sed -i 's/do.cleanup=.*/do.cleanup=1/g' anykernel.sh
          
          # Definir nombres aceptados
          sed -i 's/device.name1=.*/device.name1=a05/g' anykernel.sh
          sed -i 's/device.name2=.*/device.name2=a05m/g' anykernel.sh
          sed -i 's/device.name3=.*/device.name3=SM-A055M/g' anykernel.sh
          
          # Corrección crítica de la ruta del bloque para Samsung/MediaTek
          sed -i 's|block=.*;|block=/dev/block/by-name/boot;|g' anykernel.sh
          sed -i 's/is_slot_device=.*/is_slot_device=0/g' anykernel.sh
          sed -i 's/ramdisk_compression=.*/ramdisk_compression=auto/g' anykernel.sh
          
          zip -r9 ../Kernel-A05-Panda-MonitorMode.zip * -x .git README.md *placeholder
