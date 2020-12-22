#!/bin/env bash
# File : InstallPt2.sh


echo "--------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "							ARCH CHROOT 								"
echo ""
echo "---------------------------------------------------------------------------------------------------------------------------"


echo "TIME ZONE"

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo Run hwclock to generate /etc/adjtime

sleep 1 

hwclock --systohc

echo "Localization " 

echo Uncomment en_US.UTF-8 UTF-8


sleep 4


cp locale.gen /etc/

echo "TO GENERATE LOCALE"

sleep 4

locale-gen

echo "Create The Locale.conf and set Lang Accordingly "

cp locale.conf /etc/

cat /etc/locale.conf
sleep 3
echo ""

echo "CREATE HOSTNAME FILE "

cp hostname /etc/

cat /etc/hostname

sleep 4 


echo "CREATE HOSTS FILE "
cp hosts /etc/
cat /etc/hosts
sleep  4 

echo "---------------------------------------------------"
echo ""
echo "			ENTER ROOT PASSWORD :		"
echo ""
echo "---------------------------------------------------"

passwd

echo "---------------------------------------------------------------------------------------------"

echo "						BOOTLOADER 					   "
echo ""
echo "----------------------------------------------------------------------------------------------"


pacman -S grub efibootmgr os-prober 
os-prober

grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=Arch
mkdir /mnt2
fdisk -l
read -p "Enter Name Of the EFI Partition [for example /dev/sda1 ] :  " efi_part
mount $efi_part  /mnt2
grub-mkconfig -o /boot/grub/grub.cfg

echo "------------------------------------------------------------------------------------------"
echo ""
echo "					MICROCODE 						"
echo ""
echo "-------------------------------------------------------------------------------------------"

echo For Intel Processors
pacman -S intel-ucode



grub-mkconfig -o /boot/grub/grub.cfg

echo "------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "							REBOOT									"
echo ""
echo "----------------------------------------------------------------------------------------------------------------------------"


systemctl enable NetworkManager.service




echo Reboot now 
echo Enter exit or ctrl-d , then enter reboot and then remove the installation media

