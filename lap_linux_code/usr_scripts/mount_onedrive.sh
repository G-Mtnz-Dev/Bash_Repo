#!/bin/bash
# /usr/local/bin/mount_onedrive.sh

MOUNT_POINT="/home/gerar_kde/One_Drive"

exec /usr/bin/rclone mount \
    onedrive: "$MOUNT_POINT" \
    --vfs-cache-mode writes \
    --allow-other \

    exit 0
