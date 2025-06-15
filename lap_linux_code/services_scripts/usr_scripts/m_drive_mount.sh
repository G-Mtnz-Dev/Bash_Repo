# **************************************************************************** #
#                                                                              #
#                                                         #        #           #
#    m_drive_mount.sh                                    #      +   #          #
#                                                       #      +     #         #
#    By: Gerardo Mtnz. <dev.gmartinez@gmail.com>       #      +       #        #
#                                                       #    +       #         #
#    Created: 2025/05/28 13:59:15 by Gerardo Mtnz.       #  +       #          #
#    Updated: 2025/05/28 14:00:11 by Gerardo Mtnz.        #       #            #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
# /usr/local/bin/m_drive_mount.sh

rclone mount --vfs-cache-mode=full --allow-non-empty gdrive: /home/gerar_kde/Drive

exit 0
