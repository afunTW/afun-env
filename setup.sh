#!/usr/bin/bash

# ##############################
# System
# ##############################
sudo apt update
sudo apt install -y \
    git curl tree byobu \
    powerline fonts-powerline

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
