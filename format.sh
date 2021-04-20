#/bin/bash
#format all partitions and mount them
mkfs.fat	-F32	/dev/sda1
mkswap				/dev/sda2
mkfs.ext4			/dev/sda3

mkdir /boot/EFI
mount	/dev/sda1	/boot/EFI
swapon	/dev/sda2
mount	/dev/sda3	/mnt

#pacstrap necessary software before CHROOT
pacstrap	/mnt	base	linux	linux-firmware
pacstrap	/mnt	man-db man-pages texinfo pacman vim bash wget git grub sudo freetype2 fuse2 
dosfstools efibootmgr libisoburn os-prober mtools coreutils e2fsprogs ntfs3-dkms util-linux sysstat 
lvm2 iputils iproute2 netctl connman networkmanager systemd procps procfs

#generate file system table
genfstab -U /mnt >> /mnt/etc/fstab

#chroot jail
arch-chroot	/mnt
