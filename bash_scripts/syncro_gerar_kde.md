# **Syncro gerar\_kde**

## **Explicación Script**

<table><tbody><tr><td><ul><li>FreeFileSync no acepta múltiples archivos <code>.ffs_batch</code> en una sola llamada.</li></ul></td></tr><tr><td><ul><li>Cada archivo debe ejecutarse por separado.</li></ul></td></tr></tbody></table>

## **Código bash**

```typescript
BATCH_DIR="/home/gerar_kde/.Syncro/Batch"

"$FFSYNC" "$BATCH_DIR/1_Perfiles_Esp_Contenido_Perfiles-Elimin.ffs_batch"
"$FFSYNC" "$BATCH_DIR/2_Iconos_Esp_Contenido_Iconos-Elimin.ffs_batch"
"$FFSYNC" "$BATCH_DIR/3_LnxRepo_Esp_Elim_Perm.ffs_batch"
```

11