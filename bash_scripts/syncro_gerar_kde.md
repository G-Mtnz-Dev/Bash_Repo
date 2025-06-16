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

<table><tbody><tr><td><ul><li>FreeFileSync no acepta múltiples archivos &lt;.ffs_batch&gt; en una sola llamada. Cada archivo debe ejecutarse por separado</li></ul></td></tr></tbody></table>

### **Creamos 2 Variables:**

<table><tbody><tr><td>1 - &nbsp; &nbsp;Para FreeFileSync con la ruta y el ejecutable: &nbsp; &nbsp;<code><strong>FFS</strong></code></td></tr><tr><td>2 - &nbsp; &nbsp;Para la ruta de los Archivos de sincronización &nbsp;<code><strong>B_DIR</strong></code></td></tr></tbody></table>

```
FFS="/usr/local/bin/
```

```
B_DIR="/home/gerar_kde/.Syncro/Batch"
```

### **Llamamos a cada Archivo:**

<table><tbody><tr><td><pre><code class="language-">"$[Variable-Freefilesync]" "[Variable-Ruta\al\Archivo]Archivo"</code></pre></td></tr></tbody></table>

FFS="/usr/local/bin/  
BATCH\_DIR="/home/gerar\_kde/.Syncro/Batch"