#!/usr/bin/bash

# ##############################
# Base
# ##############################
sudo apt update
sudo apt install -y \
    byobu curl git htop jq make tree wget

# ##############################
# Shell
# ##############################
bash scripts/enhance_zsh.sh

# ##############################
# IDE
# ##############################
sudo apt install -y vim neovim

# ##############################
# Network
# ##############################
#/bin/bash scripts/install_openvpn3_client.sh

# ##############################
# Python
# ##############################
sudo apt install -y build-essential python-openssl python3-pip

# ##############################
# Development
# ##############################
#sudo apt install -y fzf
#bash devtools/setup_alternative.sh
#bash devtools/setup_gitconfig.sh
#bash devtools/setup_zshrc.sh
#bash devtools/setup_nvim.sh
