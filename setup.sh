#!/usr/bin/bash

# ##############################
# System
# ##############################
sudo apt update
sudo apt install -y \
    git curl tree byobu \
    powerline fonts-powerline

# ##############################
# VPN
# ##############################
sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp
sudo apt-get update
sudo apt-get install network-manager-l2tp-gnome

# ##############################
# NodeJs
# ##############################
sudo apt install -y nodejs npm

# ##############################
# Devtools
# ##############################
./devtools/setup_alternative.sh
./devtools/setup_gitconfig.sh
./devtools/setup_zshrc.sh
./devtools/setup_nvim.sh
