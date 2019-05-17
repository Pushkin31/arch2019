#!/bin/bash
echo 'Установка темы для grub'

ROOT_UID=0

# проверка готовности команд
function has_command() {
    command -v $1 > /dev/null
}

if [ "$UID" -eq "$ROOT_UID" ]; then

  #Копируем Vimix
  cp -a Vimix /boot/grub/themes

  #Установка Vimix
  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
  echo "GRUB_THEME=\"/boot/grub/themes/Vimix/theme.txt\"" >> /etc/default/grub

  #Обновляем grub
  if has_command update-grub; then
    update-grub
  elif has_command grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
  fi

  echo -e "\n Завершено!"

else
  echo -e "\n Пожалуйста, запустите скрипт от пользователя root..."
fi
