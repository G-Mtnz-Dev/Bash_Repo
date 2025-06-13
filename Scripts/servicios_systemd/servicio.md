# **Crear un servicio systemd**

## **1 - Crear script de montaje**

```
#!/bin/bash
# /usr/local/bin/file-name.sh

rclone mount --allow-non-empty gdrive: /home/gerar_kde/Drive &

end
```

## **2 - Darle permisos de ejecución:**

```
sudo chmod +x /usr/local/bin/file-name_.sh
```

## 3 - Crear Archivo de Servicio systemd:

Ruta:  /etc/systemd/system/_file-name_.service  

```
[Unit]
Description=Montar Google Drive al inicio
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=gerar_kde@Lap-Linux
ExecStart=/usr/local/bin/montar_drive.sh
Restart=on-failure

[Install]
WantedBy=default.target
```

**4 - Habilitar el servicio al inicio:**

```
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable montar_drive.service
```

## **5 - Prueba el script sin reiniciar:**

```
sudo systemctl start montar_drive.service  
```

# **CORRECCIÓN**

### 🔍 **1\. Problemas posibles en tu script**

#!/bin/bash rclone mount --allow-non-empty gdrive: /home/gerar\_kde/Drive & exit

#### Problemas:

El & hace que el proceso se ejecute en segundo plano, y luego haces exit, lo que **mata el proceso del script junto con el montaje**, porque Type=simple espera que el proceso continúe.

\--allow-non-empty **no es recomendable**, puede causar errores si la carpeta ya tiene contenido.

No usas --vfs-cache-mode, que **es obligatorio** para muchas operaciones con rclone mount.

🔧 **Corregido:**

```
#!/bin/bash

/usr/bin/rclone mount \
 gdrive: /home/gerar_kde/Drive \
 --vfs-cache-mode writes \
 --allow-other
```

Asegúrate de que /home/gerar\_kde/Drive **existe** y que tienes permiso.

---

### 🛠️ **2\. Corrección del archivo de servicio systemd**

Tu archivo actual tiene un problema en la línea de User=:

**User=gerar\_kde@Lap-Linux  # ❌ Esto es inválido**

**User= debe contener solo el nombre de usuario del sistema, no el hostname. Entonces debe ser:**

**User=gerar\_kde**

#### 🧪 Archivo corregido completo:

```
[Unit]
Description=Montar Google Drive al inicio
After=network-online.target
Wants=network-online.target
[Service]
Type=simple
User=gerar_kde
ExecStart=/usr/local/bin/montar_drive.sh
Restart=on-failure
Environment=PATH=/usr/bin:/bin [Install]
WantedBy=default.target
```

---

### ✅ Pasos finales:

Revisa la ruta de \*\*rclone\*\*:

```
which rclone
```

Asegúrate de que es /usr/bin/rclone o cambia la ruta en el script si es diferente.

Revisar logs del servicio:

Después de hacer sudo systemctl start montar\_drive.service, revisa con:

```
journalctl -u montar_drive.service --no-pager
```

Ahí verás si falla algo como permisos, rutas, o errores de rclone.

Recarga y reinicia el servicio Drive:

```
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart montar_drive.service
```

Recarga y reinicia el servicio One Drive:

```
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart montar_onedrive.service
```