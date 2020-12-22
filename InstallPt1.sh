#!/bin/env bash
# File : InstallPt1.sh

echo "Wifi "

sleep 2

wifi-menu

echo ping to google.com

sleep 7

ping -c 4 google.com



echo "--------------------------------------------------------------------------"
echo ""
echo "				UPDATE THE SYSTEM CLOCK				"
echo ""
echo "---------------------------------------------------------------------------"

timedatectl set-ntp true 

echo "Service Status"

sleep 4

timedatectl status

echo "TO CHANGE SYSTEM CLOCK"

sleep 3

timedatectl set-timezone Asia/Kolkata

timedatectl status

echo "-----------------------------------------------------------------------"
echo ""
echo "				FORMAT THE PARTITION			     "
echo ""
echo "------------------------------------------------------------------------"

cfdisk
fdisk -l


echo -e "\n\n"
read -p "Enter Name Of Boot Partition [for example /dev/sda7 ] :  " boot_part
echo -e "\n\n"
read -p "Enter Name of Root Partition [for example /dev/sda8 ] : " root_part
echo ""
read -p "Enter Name of Home Partition [for exmple /dev/sda9 ] :  " home_part

echo ""
read -p  "Enter Name Of Swap Partition [for example /dev/sda10] : " swap_part


mkfs.ext4   $root_part
mkfs.ext4   $home_part
mkswap   $swap_part
swapon $swap_part
mkfs.fat -F32 $boot_part





echo "------------------------------------------------------------------------"
echo ""
echo "				MOUNT THE FILESYSTEM 				"
echo ""
echo "---------------------------------------------------------------------------"

mount $root_part  /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount $boot_part /mnt/boot
mount $home_part /mnt/home

echo "------------------------------------------------------------------------------"
echo""
echo "					INSTALLATION 					"
echo ""
echo "------------------------------------------------------------------------------"

echo "Edit Mirrorlist file /etc/pacman.d/mirrorlist"


sleep 2

vim /etc/pacman.d/mirrorlist



echo "------------------------------------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "									Downloading Essential Packages 								"
echo ""
echo "---------------------------------------------------------------------------------------------------------------------------------------------------------"
pacstrap /mnt base linux linux-firmware vim man-db man-pages networkmanager 

echo "---------------------------------------------------------------------------------"
echo ""
echo "				CONFIGURE THE SYSTEM 					"
echo ""
echo "------------------------------------------------------------------------------------"

echo " Generate an Fstab File "

genfstab -U /mnt >> /mnt/etc/fstab

sleep 3

echo To Check the result of the Fstab File 

sleep 3

cat /mnt/etc/fstab
sleep 2
echo ""
echo ""
sleep 2
echo "--------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "							ARCH CHROOT 								"
echo ""
echo "---------------------------------------------------------------------------------------------------------------------------"


cp applications.sh  hostname  hosts  InstallPt1.sh InstallPt2.sh  locale.conf  recommend.sh  client.conf locale.gen    /mnt/root  

echo "Now Check What Should be done "

arch-chroot /mnt
