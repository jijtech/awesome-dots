#!/bin/bash

######################################
###########>INSTALLATION<#############
######################################

cp -r polybar $HOME/.config/
cp -r rofi $HOME/.config/
cp -r awesome $HOME/.config/
cp -r dunst $HOME/.config/
cp -r zathura $HOME/.config/
cp -r alacritty $HOME/.config/
cp -r picom.conf $HOME/.config/
cd ../
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Agave.zip
unzip Agave.zip -d $HOME/.fonts/
fc-cache -vf
rm -rf dots

echo "Install done! Do 'xrdb ~/.Xresources' then Logout or Restart WM"
