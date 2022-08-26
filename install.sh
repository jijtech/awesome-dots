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
rm -rf awesome-dots

echo "Install done! Do 'xrdb ~/.Xresources' then Logout or Restart WM"
