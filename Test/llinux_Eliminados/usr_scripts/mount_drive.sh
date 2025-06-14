#!/bin/bash
#/usr/local/bin/mount_drive.sh

MOUNT_POINT="/home/gerar_kde/Drive"

exec /usr/bin/rclone mount \
    gdrive: "$MOUNT_POINT" \
    --vfs-cache-mode writes \
    --allow-other \

    exit 0
