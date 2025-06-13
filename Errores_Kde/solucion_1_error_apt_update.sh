# To prevent unsuppoorted architecture error messages from apt on Ubuntu 24.04 (Noble Numbat)
# with the new apt sources format

# Example error messages on `apt update` after a fresh install: 
# N: Skipping acquire of configured file 'main/binary-i386/Packages' as repository 'https://packages.microsoft.com/repos/edge stable InRelease' doesn't support architecture 'i386'
# N: Skipping acquire of configured file 'main/binary-i386/Packages' as repository 'https://dl.google.com/linux/chrome/deb stable InRelease' doesn't support architecture 'i386'

# Para evitar mensajes de error de arquitectura no compatible de apt en Ubuntu 24.04 (Noble Numbat)
# con el nuevo formato de fuentes apt

# Ejemplos de mensajes de error en `apt update` después de una nueva instalación:
# N: Omitir la adquisición del archivo configurado 'main/binary-i386/Packages' ya que el repositorio 'https://packages.microsoft.com/repos/edge stable InRelease' no admite la arquitectura 'i386'
# N: Omitir la adquisición del archivo configurado 'main/binary-i386/Packages' ya que el repositorio 'https://dl.google.com/linux/chrome/deb stable InRelease' no admite la arquitectura 'i386'

#################################################
### SINGLE-ARCH (i.e. fix arch-related error) ###
#################################################

# Example for X86_64 (Keeping amd64, removing i386)
# Ejemplo para X86_64 (manteniendo amd64, eliminando i386)

[[ $(dpkg --print-foreign-architectures) =~ i386 ]] && { sudo dpkg --remove-architecture i386; }
sudo sed -r -i '/^Arch/d;s/URIs:/Architectures: amd64\n&/g' /etc/apt/sources.list.d/*.sources

# Example for ARM64 (Keeping arm64, removing armhf)
# Ejemplo para ARM64 (manteniendo arm64, eliminando armhf)

[[ $(dpkg --print-foreign-architectures) =~ armhf ]] && { sudo dpkg --remove-architecture armhf; }
sudo sed -r -i '/^Arch/d;s/URIs:/Architectures: arm64\n&/g' /etc/apt/sources.list.d/*.sources


#################################################
### MULTI-ARCH (i.e. for cross compiling) ###
#################################################

# Supported Debian architecture names by Ubuntu release:
    # Ubuntu 16.04 (Xenial Xerus): amd64, i386, arm64, armhf, powerpc, ppc64el, s390x
    # Ubuntu 18.04 (Bionic Beaver): amd64, i386, arm64, armhf, ppc64el, s390x
    # Ubuntu 20.04 (Focal Fossa): amd64, i386, arm64, armhf, ppc64el, riscv64, s390x
    # Ubuntu 22.04 (Jammy Jellyfish): amd64, i386, arm64, armhf, ppc64el, riscv64, s390x
    # Ubuntu 24.04 (Noble Numbat): amd64, i386, arm64, armhf, ppc64el, riscv64, s390x

# Nombres de arquitectura Debian compatibles según la versión de Ubuntu:
    # Ubuntu 16.04 (Xenial Xerus): amd64, i386, arm64, armhf, powerpc, ppc64el, s390x
    # Ubuntu 18.04 (Bionic Beaver): amd64, i386, arm64, armhf, ppc64el, s390x
    # Ubuntu 20.04 (Focal Fossa): amd64, i386, arm64, armhf, ppc64el, riscv64, s390x
    # Ubuntu 22.04 (Jammy Jellyfish): amd64, i386, arm64, armhf, ppc64el, riscv64, s390x
    # Ubuntu 24.04 (Noble Numbat): amd64, i386, arm64, armhf, ppc64el, riscv64, s390x
    # Ubuntu 24.10 (Oracular Oriole): amd64, arm64, i386, ppc64el, riscv64, s390x

# First add the architectures desired

# Primero agregue las arquitecturas deseadas


for A in amd64 arm64 riscv64 do;
  [[ $(dpkg --print-foreign-architectures) =~ ${A} ]] || { sudo dpkg --add-architecture ${A}; }
 done

# NOTE: Use space-separated debian machine architecture names for multi arch

# NOTA: Utilice nombres de arquitectura de máquinas Debian separados por espacios para arquitecturas múltiples


sudo sed -r -i '/^Arch/d;s/URIs:/Architectures:\x20amd64\x20arm64\x20riscv64\n&/g' /etc/apt/sources.list.d/*.sources

