#!/bin/bash

######################################
###########>INSTALLATION<#############
######################################

#moving stuff
cp -r polybar $HOME/.config/
cp -r rofi $HOME/.config/
cp -r awesome $HOME/.config/
cp -r dunst $HOME/.config/
cp -r zathura $HOME/.config/
cp -r tabby $HOME/.config/
cp -r picom.conf $HOME/.config/
cp -r gtk-3.0 $HOME/.config/
cd ../

#Getting fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Ubuntu.zip
unzip Ubuntu.zip -d $HOME/.fonts/
fc-cache -vf

#Grapping the terminal
wget https://github.com/Eugeny/tabby/releases/download/v1.0.188/tabby-1.0.188-linux-x64.rpm
sudo dnf install tabby-1.0.188-linux-x64.rpm

#finishing cleanup
rm -rf dots

#report completion
echo "Install done! Do 'xrdb ~/.Xresources' then Logout or Restart WM"
