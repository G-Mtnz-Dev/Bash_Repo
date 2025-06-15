#!/bin/bash
#/usr/lib/systemd/system-shutdown/
# Script para ejecutar FreeFileSync usando el archivo de configuración .ffs_batch

# Aceptar argumento del tipo de apagado (reboot, halt, poweroff)
MODE="$1"

/usr/local/bin/FreeFileSync /usr/local/llcod/Syncro_Perfiles_D.ffs_batch >>  /home/gerar_kde/.logs/Syncro_Logs/sync_perfiles.log 2>&1

