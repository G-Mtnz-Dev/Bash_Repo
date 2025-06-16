#!/bin/bash
#/usr/local/llcode/

FFS="/usr/local/bin/FreeFileSync"

B_DIR="/home/gerar_kde/.Syncro/Batch"

"$FFS" "$B_DIR/1_Perfiles_Esp_Contenido_Perfiles-Elimin.ffs_batch"
"$FFS" "$B_DIR/2_Iconos_Esp_Contenido_Iconos-Elimin.ffs_batch"
"$FFS" "$B_DIR/3_LnxRepo_Esp_Elim_Perm.ffs_batch"
