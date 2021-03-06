#!/bin/bash
sudo pacman -Syu
sudo pacman -S git --noconfirm
sudo pacman -S wget --noconfirm

echo Установка драйверов nvidia
sudo pacman -S nvidia  nvidia-utils  lib32-nvidia-utils nvidia-settings


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

echo 'Установка "pamac-aur" из AUR'
git clone https://aur.archlinux.org/pamac-aur.git
cd pamac-aur
makepkg -si --needed --noconfirm --skippgpcheck
rm -rf pamac-aur_install


echo 'Установка программ'
sudo pacman -S ufw firefox firefox-i18n-ru gimp libreoffice libreoffice-fresh-ru screenfetch vlc qbittorrent f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils gnome-calculator file-roller p7zip pulseaudio gwenview qt4 packagekit-qt5 exfat-utils filezilla thunar htop keepass --noconfirm

yay -S flameshot-git svp telegram-desktop octopi jmtpfs notepadqq --noconfirm

echo 'Установка графической оболочки для su и sudo'
yay -S gksu

#Открываем любой каталог

#Правка - особые действия

#Открыть с правами root
#gksu thunar %f
#Условия появления - каталоги

#Редактировать с правами root
#gksu mousepad %f
#Условия появления - текстовые файлы

#Cменить владельца файла на root
#gksu chown root %F
#Условия появления - каталоги и текстовые файлы

#Cменить владельца каталога на root
#gksu chown root %F
#Условия появления - каталоги и текстовые файлы

#Cменить владельца на User123
#gksu chown User123 %F
#Условия появления - каталоги и текстовые файлы

#Cменить владельца каталога на User123
#gksu chown User123 %F
#Условия появления - каталоги и текстовые файлы


echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Добавляем в автозагрузку:'
sudo systemctl enable ufw

echo 'Установка завершена!'
