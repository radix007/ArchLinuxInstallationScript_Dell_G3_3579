#!/bin/env bash
# File : recommend.sh

systemctl enable NetworkManager.service
systemctl start NetworkManager.service

echo Connect to the Internet 
nmtui



echo  " Updating Mirrors Using reflector (Last 10 Recently Synchronised HTTPS mirrors sorted By Download Speed )  "
pacman -S reflector

reflector --verbose --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist




echo  General Recommendations And Installation Of Apps 

#Adding A  New User 
echo "-----------------------------------------------------------------"
echo ""
echo "			 ADDING A USER NAME 				 "
echo ""	
echo "-------------------------------------------------------------------"


read -p "Enter User Name : " user_name 
useradd -m $user_name

echo "To Check Whether The User Has Been Added or not (Check User Name , Should Be The Last Entry)" 
sleep 2
passwd -Sa

echo "------------------------------------------------------------------"
echo ""
echo " 			ENTER USER PASSWORD 				"
echo ""
echo "---------------------------------------------------------------------"

passwd $user_name


# Privilege Elevation 
pacman -S sudo vi  reflector 

#Adding a User to Wheel Group


echo "----------------------------------------------------------------------------------------"
echo ""
echo "      Adding $user_name to the Wheel Group (Privilege Elevation for User (sudo )) "
echo ""
echo "--------------------------------------------------------------------------------------------"
sleep 4

usermod --append --groups wheel $user_name

sleep 3

echo "Uncomment Wheel Group (Using visudo Command , Use Del to Delete # and then Press Esc and enter :wq and then press enter "

visudo 




#DISPLAY SERVER 

echo  " choosing Display "
sleep 1 

#XORG  -X WINDOW SERVER

sudo pacman -S xorg-server xorg-apps

#DRIVER INSTALLTION 

echo " Please Identify Your Card (Ignore The Nvidia One For Now )"
lspci | grep -e VGA -e 3D 

sudo pacman -S xf86-video-intel mesa 


echo "" 
echo ""
echo ""
echo "------------------------------------------------------------------------------------------"
echo                                        Skipping Nvidia For Now 
echo ""
echo ""
echo "--------------------------------------------------------------------------------------------"


# DESKTOP Environments 

echo ""
echo ""
echo "-----------------------------------------------------------------------------------"
echo ""
echo Downloading KDE
echo ""
echo "-----------------------------------------------------------------------------------------" 

sleep 3



sudo pacman -S plasma-desktop sddm plasma xdg-user-dirs 
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service

sudo pacman -Sy archlinux-keyring 



./applications.sh

echo "Reboot Now Or Install More Stuff "
sleep 2





