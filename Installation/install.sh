# The following are the commands I used to install Arch onto a VM. 

#Disk Partioning
    mkfs.ext2 /dev/sda2 mkfs.ext4 /dev/sda4
    #Format and activate the swap partition
    mkswap /dev/sda3 && swapon /dev/sda3
    #Mount the partitions
    mount /dev/sda4 /mnt mkdir /mnt/boot mount /dev/sda2 /mnt/boot

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

#Set hostname
    echo archlinux >/etc/hostname

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

#Configuration of pacman
     /etc/pacman.conf
     #erase the mutlib hashes to allow 32-bit packages.
    
#Add user account
     useradd -m -g users -G wheel,storage,power -s /bin/bash jabedford
     passwd jabedford
    
#Install Sudo
     pacman -S sudo
     
     
     

    
 


