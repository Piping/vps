#!/bin/bash
snap list
sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core20
sudo snap remove --purge snapd
snap list
sudo apt remove --autoremove snapd
cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.conf
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

sudo add-apt-repository ppa:mozillateam/ppa
sudo apt-get update
sudo apt-get install firefox-esr firefox-esr-locale-zh-hans

# optional install chromium browser
cat <<EOF | sudo tee /etc/apt/preferences.d/pin-xalt7x-chromium-deb-vaapi
Package: *
Pin: release o=LP-PPA-xalt7x-chromium-deb-vaapi
Pin-Priority: 1337
EOF
sudo add-apt-repository ppa:xalt7x/chromium-deb-vaapi
sudo apt update
sudo apt-get install chromium-browser
