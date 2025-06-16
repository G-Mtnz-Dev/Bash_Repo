# **syncro\_gerar\_kde.sh**

## **Script:**

```
#!/bin/bash
#/usr/local/llcode/

FFS="/usr/local/bin/FreeFileSync"
B_DIR="/home/gerar_kde/.Syncro/Batch"

"$FFS" "$B_DIR/1_Perfiles_Esp_Contenido_Perfiles-Elimin.ffs_batch"
"$FFS" "$B_DIR/2_Iconos_Esp_Contenido_Iconos-Elimin.ffs_batch"
"$FFS" "$B_DIR/3_LnxRepo_Esp_Elim_Perm.ffs_batch"
```

---

## **Explicación Script**

**FreeFileSync no acepta múltiples archivos** `_**<.ffs_batch>**_` **en una sola llamada. Cada archivo debe ejecutarse por separado.**

<table><tbody><tr><td><ul><li>FreeFileSync no acepta múltiples archivos &lt;.ffs_batch&gt; en una sola llamada. Cada archivo debe ejecutarse por separado</li></ul></td></tr></tbody></table>

### **Creamos 2 Variables:**

             1 - Para FreeFileSync con la ruta y el ejecutable:    `**FFS**`

             2 - Para la ruta de los Archivos de sincronización  `**B_DIR**`

```
FFS="/usr/local/bin/
B_DIR="/home/gerar_kde/.Syncro/Batch"
```

FFS="/usr/local/bin/  
BATCH\_DIR="/home/gerar\_kde/.Syncro/Batch"