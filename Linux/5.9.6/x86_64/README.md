### dot-config

The default kernel config is the very same one distributed by Arch Linux, with
a few minor changes:

1. `CONFIG_DEFAULT_HOSTNAME` is set to "GoboLinux"
2. `CONFIG_LOCALVERSION` is set to "-Gobo"
3. `CONFIG_GOBOHIDE_FS=y`
4. `CONFIG_DM_CRYPT=y` (as opposed to `=m`)
5. `CONFIG_ENCRYPTED_KEYS=y` (as opposed to `=m`)

The last two items are needed so that Dracut can load the `dm-crypt` module and
switch root to an encrypted rootfs partition.

```
wget https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux/trunk/config -O dot-config
sed -i dot-config \
    -e 's,CONFIG_DEFAULT_HOSTNAME=.*,CONFIG_DEFAULT_HOSTNAME="GoboLinux",g' \
    -e 's,CONFIG_LOCALVERSION=.*,CONFIG_LOCALVERSION="-Gobo",g' \
    -e 's,CONFIG_DM_CRYPT=m,CONFIG_DM_CRYPT=y,g' \
    -e 's,CONFIG_ENCRYPTED_KEYS=m,CONFIG_ENCRYPTED_KEYS=y,g'
echo CONFIG_GOBOHIDE_FS=y >> dot-config
```

### WriteBoot64

This utility generates the GRUB UEFI application that loads the kernel. It also
creates the initramfs image that fits the current host (i.e., it's not a complete
image with a comprehensive set of kernel modules). The initramfs, along with the
kernel image and System.map files, are copied to the ESP partition under /BOOT.
The UEFI application is installed as /EFI/BOOT/BOOTX64.EFI.
