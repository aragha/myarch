#/bin/bash
ln -sf	/usr/share/zoneinfo/US/Eastern	/etc/localtime
#echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
sed -i "s/#en_US.UTF-8/en_US.UTF-8/"
locale-gen
hwclock	--systohc
echo "keymap=US" >> locale-gen

#create hostname file
echo "archvbox"	/etc/hostname

#local hostname resolution
echo "127.0.0.1	localhost
::1	localhost
127.0.1.1	archvbox.localdomain	archvbox" >> /etc/hosts

#install grub 
pacman	-S grub
pacman -Syu efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/sda1   /boot/EFI
grub-install	--target=x86_64-efi	--bootloader-id=grub-uefi	--recheck
#make grub config file
grub-mkconfig	-o	/boot/grub/grub.cfg

#install other necessary tools
pacman -Syu bison gcc make python texinfo patch

pacman	-Syu networkmanager vim
#enable networkmanager
systemctl enable 	NetworkManager
exit
