#!/bin/bash
sudo pacman -Syu
sudo pacman -S git --noconfirm

mkdir -p /tmp/yay_install
cd /tmp/yay_install

echo 'Установка "yay" из AUR'
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sir --needed --noconfirm --skippgpcheck
rm -rf yay_install


sudo pacman -Syu

mkdir -p /tmp/pamac-aur_install
cd /tmp/pamac-aur_install

'Установка "pamac-aur" из AUR'
git clone https://aur.archlinux.org/pamac-aur.git
cd pamac-aur
makepkg -si --needed --noconfirm --skippgpcheck
rm -rf pamac-aur_install


echo 'Установка программ'
sudo pacman -S firefox  gimp libreoffice libreoffice-fresh-ru  screenfetch vlc qbittorrent f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils gnome-calculator file-roller p7zip pulseaudio gwenview --noconfirm

echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Установка завершена!'
rm -rf ~/arch_3.sh
