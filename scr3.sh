#/bin/bash
ln -sf	/usr/share/zoneinfo/US/Eastern	/etc/localtime
echo "en_US.UTF-8" >> /etc/locale.gen
hwclock	--systohc
locale-gen
echo "keymap=US" >> locale-gen

#create hostname file
echo "archvbox"	/etc/hostname

#local hostname resolution
echo "127.0.0.1	localhost
::1	localhost
127.0.1.1	archvbox.localdomain	archvbox" >> /etc/hosts

#install grub 
pacman	-S grub

mkdir /boot/EFI
mount /dev/sda1   /boot/EFI
grub-install	--target=x86_64-efi	--bootloader-id=grub-uefi	--recheck
#make grub config file
grub-mkconfig	-o	/boot.grub/grub.cfg

#install other necessary tools
pacman -Syu bison gcc make python texinfo patch

#pacman	-S networkmanager vim
#enable networkmanager
systemctl enable 	NetworkManager
exit
