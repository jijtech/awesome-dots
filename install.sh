#!/bin/bash

######################################
###########>INSTALLATION<#############
######################################

#Grapping the terminal
echo "installing dependencies"
wget https://github.com/Eugeny/tabby/releases/download/v1.0.188/tabby-1.0.188-linux-x64.rpm
sudo dnf install tabby-1.0.188-linux-x64.rpm awesome polybar xorg dunst rofi playerctl picom vim pcmanfm acpi zathura firefox lxpolkit materia-gtk-theme lxappearance blueman pavucontrol zsh ffmpeg ffmpeg-libs deepin-icon-theme

#moving stuff
cp -r polybar $HOME/.config/
cp -r rofi $HOME/.config/
cp -r awesome $HOME/.config/
cp -r dunst $HOME/.config/
cp -r zathura $HOME/.config/
cp -r tabby $HOME/.config/
cp -r picom.conf $HOME/.config/
cp -r gtk-3.0 $HOME/.config/
cp -r icons $HOME/
cd ../

#setting qt5
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> .bash_profiles

#hidding icons
mv icons .icons

#Getting fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Ubuntu.zip
unzip Ubuntu.zip -d $HOME/.fonts/
fc-cache -vf

#finishing cleanup
rm -rf dots

#report completion
echo "Install done! Do 'xrdb ~/.Xresources' then Logout or Restart WM"
