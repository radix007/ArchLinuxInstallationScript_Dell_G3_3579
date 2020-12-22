#!/bin/env bash
# File : yay_packages.sh


sleep 4
echo "----------------------------------------------------------------------------------- "
echo "                                  INSTALLING yay                                    "
echo "-------------------------------------------------------------------------------------"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "Visual Studio "
sleep 4

yay -S visual-studio-code-bin  
echo "Proton VPN"
sleep 4
yay -S openvpn-update-systemd-resolved aic94xx-firmware wd719x-firmware


sudo systemctl start firewalld.service
sudo systemctl enable firewalld.service
sudo systemctl start systemd-resolved.service 
sudo systemctl enable systemd-resolved.service
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service 
sudo cp client.conf /etc/openvpn/client/
sudo systemctl enable sddm.service 
