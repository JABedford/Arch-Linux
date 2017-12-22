#Disk Partioning

    fdisk /dev/sda
    n -- new partition
    (enter) (p -- primary disk)
    (enter) (1 -- partition number)
    (enter) set first sector
    (enter) set last sector (use whole disk)
    w -- write partition table and quit

#Format partition:
    mkfs.ext4 /dev/sda1

#Mount filesystem:
    mount /dev/sda1 /mnt

#Base packages:
    pacstrap /mnt base

#Generate /etc/fstab:
    genfstab -U /mnt >>/mnt/etc/fstab

#Change root to the newly created system:
    arch-chroot /mnt

#Set the timezone, e.g.:
    ln -sf /usr/share/zoneinfo/London /etc/localtime

#Generate /etc/adjtime:
    hwclock --systohc

#Enable locale:

    #Uncomment your preferred locale (e.g. en_GB.UTF-8 UTF-8) in /etc/locale.gen using vi.
    #Run locale-gen.
    #Put the corresponding LANG variable (e.g. LANG=en_GB.UTF-8) in /etc/locale.conf:
        echo 'LANG=en_GB.UTF-8' >/etc/locale.conf

#Set hostname (e.g. arch):
    echo arch >/etc/hostname

#Enable DHCP client daemon:
    systemctl enable dhcpcd

#Set root password:
    passwd
      #password entry 1
      #password entry 2

#Install GRUB:

    pacman -S grub
    grub-install --target=i386-pc /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg

#Reboot:

    exit
    umount -R /mnt
    reboot
