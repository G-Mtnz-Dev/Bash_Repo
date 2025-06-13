#!/bin/bash
# /usr/local/bin/montar_drive.sh

MOUNT_POINT="/home/gerar_kde/Drive"
LOG_FILE="/var/log/montar_drive.log"
DATE_SUFFIX="$(date '+%Y-%m-%d')"
DEST_DIR="/home/gerar_kde/.logs"
DEST_LOG="$DEST_DIR/montar_drive_$DATE_SUFFIX.log"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

# Limitar tamaño del log principal
if [ -f "$LOG_FILE" ] && [ "$(wc -l < "$LOG_FILE")" -gt 500 ]; then
    tail -n 200 "$LOG_FILE" > "${LOG_FILE}.tmp" && mv "${LOG_FILE}.tmp" "$LOG_FILE"
fi

# Registro inicial
echo "[$TIMESTAMP] Inicio del montaje de Google Drive" >> "$LOG_FILE"

# Verifica si ya está montado
if mountpoint -q "$MOUNT_POINT"; then
    echo "Google Drive ya está montado en $MOUNT_POINT" >> "$LOG_FILE"
    exit 0
fi

# Verifica que el punto de montaje exista
if [ ! -d "$MOUNT_POINT" ]; then
    echo "Error: el directorio $MOUNT_POINT no existe." >> "$LOG_FILE"
    exit 1
fi

# Verifica si hay conectividad antes de montar
if ! ping -c 1 -W 2 www.googleapis.com &> /dev/null; then
    echo "No hay conexión a internet. Reintentará más tarde..." >> "$LOG_FILE"
    exit 2
fi

# Montar con rclone
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Ejecutando rclone mount..." >> "$LOG_FILE"

# Este exec reemplazará el script por rclone solo si llega hasta aquí
exec /usr/bin/rclone mount \
    gdrive: "$MOUNT_POINT" \
    --vfs-cache-mode writes \
    --allow-other \
    --dir-cache-time 1h \
    --poll-interval 1m \
    --timeout 1m \
    --umask 002 \
    --log-level INFO \
    --log-file "$LOG_FILE"

# Si exec falla, se ejecutará esta parte (lo cual no debería pasar normalmente)
# Copia el log al directorio del usuario (solo si no fue reemplazado por exec)
if [ -d "$DEST_DIR" ]; then
    cp "$LOG_FILE" "$DEST_LOG"
    echo "[Info] Log copiado a $DEST_LOG" >> "$LOG_FILE"
else
    echo "[Warning] No se pudo copiar el log a $DEST_DIR (no existe)" >> "$LOG_FILE"
fi

exit 0
