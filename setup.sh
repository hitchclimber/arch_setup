#!/bin/bash
#
# This script sets up the boring parts of an arch install
#
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
sed -i '133s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1" >> /etc/hosts
echo "::1" >> /etc/hosts
echo "127.0.0.1 arch.localdomain arch" >> /etc/hosts

pacman -S linux-headers openssh xorg webkit2gtk zsh xwallpaper dunst zathura zathura-pdf-mupdf wget curl sxiv firefox fuse-overlayfs pulseaudio pulsemixer pulseaudio-bluetooth wpa-supplicant # correct drivers for your graphics card, check wiki if Optimus is needed
systemctl enable NetworkManager
systemctl enable reflector.timer

useradd -m -G wheel -s /bin/bash michael
# sed -i '85s/.//' /etc/sudoers  # risky, could also be 82


