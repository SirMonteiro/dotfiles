#!/bin/sh

git clone --depth 1 https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git /tmp/catppuccin-gtk
cd /tmp/catppuccin-gtk/themes
./install.sh -l -s compact -t mauve teal
flatpak override --user --filesystem=$HOME/.themes
flatpak override --user --filesystem=xdg-config/gtk-4.0

git clone --depth 1 https://github.com/catppuccin/Kvantum.git /tmp/catppuccin-kvantum
CATPPUCCIN_FOLDER=/tmp/catppuccin-kvantum/themes
cp -r $CATPPUCCIN_FOLDER/catppuccin-mocha-* $CATPPUCCIN_FOLDER/catppuccin-latte-* ~/.config/Kvantum/

CATPPUCCIN_COLORS=`mktemp -d`
cd $CATPPUCCIN_COLORS
curl -LO https://github.com/catppuccin/kde/releases/latest/download/Mocha-color-schemes.tar.gz
tar xf Mocha-color-schemes.tar.gz && rm -f Mocha-color-schemes.tar.gz
cp Mocha-color-schemes/* $HOME/.local/share/color-schemes

#paru -S --needed papirus-folders-catppuccin-git
papirus-folders -C cat-mocha-teal --theme Papirus-Dark

git clone --depth 1 https://github.com/catppuccin/konsole.git /tmp/catppuccin-konsole
cp /tmp/catppuccin-konsole/themes/* $HOME/.local/share/konsole

