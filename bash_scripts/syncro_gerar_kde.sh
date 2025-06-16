#!/bin/bash
#/usr/local/llcode/

FFSYNC="/usr/local/bin/FreeFileSync"

BATCH_DIR="/home/gerar_kde/.Syncro/Batch"

"$FFSYNC" "$BATCH_DIR/1_Perfiles_Esp_Contenido_Perfiles-Elimin.ffs_batch"
"$FFSYNC" "$BATCH_DIR/2_Iconos_Esp_Contenido_Iconos-Elimin.ffs_batch"
"$FFSYNC" "$BATCH_DIR/3_LnxRepo_Esp_Elim_Perm.ffs_batch"
