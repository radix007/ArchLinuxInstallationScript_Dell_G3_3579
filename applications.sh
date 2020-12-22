#!/bin/env bash
# File : Applications.sh




lspci -k | grep -A 2 -E "(VGA|3D)"

sleep 2

echo -e "\n\n\n"

sudo reflector --verbose --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist


sudo pacman -S  bash-completion nvidia nvidia-utils nvidia-settings nvidia-prime git  mesa acpi acpi_call openvpn youtube-dl vlc ntfs-3g firefox dolphin bluez bluez-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack konsole grub-customizer tmux firewalld  qbittorrent  kvantum-qt5 libreoffice-fresh thunderbird     zim gthumb evince  spectacle gnome-disk-utility p7zip tar    speedtest-cli rsync traceroute base-devel   ffmpegthumbs eog 


echo ""
echo ""
echo ""
echo "------------------------------------------_#############################################################_---------------------------------------------"
echo ""
echo "                                                          Done With Installation Enjoy Arch                                                             "
echo ""
echo "------------------------------------------------------------------------------------------------------------------------------------------------------"


