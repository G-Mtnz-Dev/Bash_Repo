#!/bin/bash
#/home/gerar_kde/.Syncro/Batch/
# Script para ejecutar FreeFileSync usando el archivo de configuración .ffs_batch

# Aceptar argumento del tipo de apagado (reboot, halt, poweroff)
MODE="$1"

/usr/local/bin/FreeFileSync /home/gerar_kde/.Syncro/Batch/1_Perfiles_Esp_Contenido_Perfiles-Elimin.ffs_batch >> /home/gerar_kde/.logs/Syncro_Logs/sync_perfiles.log 2>&1
