:'
========== ERROR KEY ====================
Debemos reemplazar la Key por la que aparece en nuestro error. 
En sí lo que hacemos con este comando es conectar a un servidor seguro de Ubuntu 
y sincronizar e importar la llave pública del repositorio instalado en nuestro equipo con una llave válida.
'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FC979028B1997C1



:'
=================== ERROR INSYNC.IO ===========================
Simplemente cambia la direccion de insync.io en tu archivo insync, en /etc/apt (en mi caso, 
en /etc/apt/sources.list.d/insync.list). Sin comillas, por supuesto. Descubrí que "apt.insync.io" 
era un CNAME para esto, y me funciona.TEP 1: Add our public GPG key to allow apt to authenticate 
the Insync repository

en:  /etc/apt/sources.list.d/insync.list
el archivo tiene:

deb http://apt.insync.io/ubuntu noble numbat non-free contrib

cambiar " apt.insync.io " por " insync-apt.b-cdn.net " 
'

deb http://insync-apt.b-cdn.net/ubuntu noble numbat non-free contrib

deb http://apt.insync.io/ubuntu noble