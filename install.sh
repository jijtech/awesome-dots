#!/bin/bash

######################################
###########>INSTALLATION<#############
######################################

#moving stuff
cp -r polybar $HOME/.config/
cp -r rofi $HOME/.config/
cp -r awesome $HOME/.config/
cp -r dunst $HOME/.config/
cp -r picom.conf $HOME/.config/
cp -r qtile $HOME/.config/
cd ../

#setting qt5
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> .bash_profiles

#Getting fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Ubuntu.zip
unzip Ubuntu.zip -d $HOME/.fonts/
fc-cache -vf

#finishing cleanup
rm -rf dots

#report completion
echo "Installation completed!"
