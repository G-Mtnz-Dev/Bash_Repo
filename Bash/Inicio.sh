# ================== LIMPIEZA ======================

sudo apt update && sudo apt upgrade && sudo snap refresh && sudo apt autoclean && sudo apt clean && sudo apt autoremove 

# ==================================================



<< 'MULTILINE-COMMENT'
============= LIMPIEZA PARTES ====================

sudo apt update
sudo apt upgrade
sudo snap refresh
sudo apt autoclean
sudo apt clean
sudo apt autoremove

==================================================
MULTILINE-COMMENT



# =========== MONTAR DRIVE =========================

rclone mount gdrive: ~/Drive &

# ==================================================






# ============ MONTAR DATOS ========================

sudo mount -t ntfs UUID=524F567904D39ECB /media/DATOS/

# ==================================================



# =========== DESMONTAR DRIVE ======================

sudo fusermount -uz ~/Drive

# ==================================================






# ============ DESMONTAR DATOS =====================

sudo umount /media/DATOS/

# ==================================================
