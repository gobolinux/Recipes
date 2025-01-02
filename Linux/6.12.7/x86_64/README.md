### dot-config

Our default kernel config is the very same one distributed by Arch Linux, with
a few minor changes:

1. `CONFIG_DEFAULT_HOSTNAME` is set to "GoboLinux"
2. `CONFIG_LOCALVERSION` is set to "-Gobo"
3. `CONFIG_GOBOHIDE_FS=y`
4. `CONFIG_DM_CRYPT=y` (as opposed to `=m`), plus its dependencies:
   - `CONFIG_ENCRYPTED_KEYS=y` (as opposed to `=m`)
   - `BLK_DEV_DM=y` (as opposed to `=m`)
   - `TRUSTED_KEYS=y` (as opposed to `=m`)

`CONFIG_DM_CRYPT=y` is needed so that Dracut can load the `dm-crypt` module and
switch root to an encrypted rootfs partition.

```
wget https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/main/config -O dot-config
sed -i dot-config \
    -e 's,CONFIG_DEFAULT_HOSTNAME=.*,CONFIG_DEFAULT_HOSTNAME="GoboLinux",g' \
    -e 's,CONFIG_LOCALVERSION=.*,CONFIG_LOCALVERSION="-Gobo",g' \
    -e 's,CONFIG_DM_CRYPT=m,CONFIG_DM_CRYPT=y,g' \
    -e 's,CONFIG_ENCRYPTED_KEYS=m,CONFIG_ENCRYPTED_KEYS=y,g' \
    -e 's,BLK_DEV_DM=m,BLK_DEV_DM=y,g' \
    -e 's,TRUSTED_KEYS=m,TRUSTED_KEYS=y,g'
echo CONFIG_GOBOHIDE_FS=y >> dot-config
```

For this repository, we also post-process it with `make LD=ld.bfd olddefconfig`
run from inside the kernel sources folder.
This selects some necessairy build options (mostly for `dm-crypt`) and adjusts
a couple of presets based on the environment.

### WriteBoot64

This utility generates the GRUB UEFI application that loads the kernel. It also
creates the initramfs image that fits the current host (i.e., it's not a complete
image with a comprehensive set of kernel modules). The initramfs, along with the
kernel image and System.map files, are copied to the ESP partition under /BOOT.
The UEFI application is installed as /EFI/BOOT/BOOTX64.EFI.
