#!/bin/bash
#/usr/local/bin/mount_datos.sh

MOUNT_POINT="/media/DATOS"
UUID="524F567904D39ECB"
FS_TYPE="ntfs3"

sudo mount -t $FS_TYPE -o rw,uid=gerar_kde,gid=gerar_kde,umask=022 UUID=$UUID "$MOUNT_POINT"

exit 0
