#!/bin/bash
echo 'Установка AUR (aurman)'
sudo pacman -Syy
sudo pacman -S git --noconfirm

#Ставим зависимость expac-git
git clone https://aur.archlinux.org/expac-git.git
cd expac-git
makepkg -si --noconfirm
cd ..
rm -rf expac-git

#Ставим aurman
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si --noconfirm --skippgpcheck
cd ..
rm -rf aurman

echo 'Установка программ'
sudo pacman -S firefox  gimp libreoffice libreoffice-fresh-ru  screenfetch vlc qbittorrent f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils gnome-calculator file-roller p7zip pulseaudio gwenview --noconfirm


echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Установка завершена!'
rm -rf ~/arch_3.sh
