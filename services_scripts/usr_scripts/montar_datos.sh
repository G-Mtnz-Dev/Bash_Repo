#!/bin/bash
#/usr/local/bin/montar_datos.sh

MOUNT_POINT="/media/DATOS"
UUID="524F567904D39ECB"
FS_TYPE="ntfs3"
LOG_FILE="/var/log/montar_datos.log"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
DEST_DIR="/home/gerar_kde/.logs"
DATE_SUFFIX="$(date '+%Y-%m-%d')"
DEST_LOG="$DEST_DIR/desmontar_drives_$DATE_SUFFIX.log"

log() {
    echo "[$TIMESTAMP] $1" >> "$LOG_FILE"
}

# Comprobamos si ya está montado
if mountpoint -q "$MOUNT_POINT"; then
    log "La partición ya está montada en $MOUNT_POINT."
    exit 0
fi

# Comprobamos si el punto de montaje existe y tiene permisos
if [ ! -d "$MOUNT_POINT" ]; then
    log "Error: El directorio $MOUNT_POINT no existe."
    exit 1
fi

if [ ! -w "$MOUNT_POINT" ]; then
    log "Error: No tienes permisos de escritura en $MOUNT_POINT."
    exit 2
fi

# Intentamos montar
mount -t $FS_TYPE -o rw,uid=1001,gid=1001,umask=022 UUID=$UUID "$MOUNT_POINT"
STATUS=$?

if [ $STATUS -eq 0 ]; then
    log "Partición montada correctamente en $MOUNT_POINT."
else
    log "Error al montar la partición (código $STATUS)."
    exit $STATUS
fi

# Función para copiar el log si existe el directorio destino
copiar_log_a_home() {
if [ -d "$DEST_DIR" ]; then
cp "$LOG_FILE" "$DEST_LOG"
echo "Log copiado a $DEST_LOG" >> "$LOG_FILE"
else
echo "Directorio de destino no encontrado: $DEST_DIR" >> "$LOG_FILE"
fi
}