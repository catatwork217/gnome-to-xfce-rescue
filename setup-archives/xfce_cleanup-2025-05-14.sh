#!/bin/bash

echo ">>> Locking XFCE as default session"
echo -e "[Desktop]\nSession=xfce" > ~/.dmrc
chmod 644 ~/.dmrc

echo ">>> Installing XFCE tools if needed"
sudo apt install xfce4 xfce4-goodies lightdm -y
sudo dpkg-reconfigure lightdm

echo ">>> Purging GNOME, GDM, and Ubuntu session"
sudo apt purge -y gnome-shell ubuntu-session gdm3 gnome-software gnome-terminal
sudo apt autoremove --purge -y

echo ">>> Installing core tools"
sudo apt install -y stacer psensor tlp bitwarden clamtk gnome-disk-utility synaptic
sudo tlp start

echo ">>> Adding Stacer & Psensor to autostart"
mkdir -p ~/.config/autostart
cp /usr/share/applications/stacer.desktop ~/.config/autostart/ 2>/dev/null
cp /usr/share/applications/psensor.desktop ~/.config/autostart/ 2>/dev/null

echo ">>> Setting power to never suspend on AC"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -s 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

echo ">>> XFCE is now the boss. Reboot recommended."
