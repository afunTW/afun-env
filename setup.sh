#!/bin/bash

# ##############################
# Base
# ##############################
sudo apt update
sudo apt install -y \
    byobu curl git htop jq make tree wget fzf

# ##############################
# Shell
# ##############################
/bin/bash scripts/install_zsh.sh
sudo apt install -y bat

# ##############################
# IDE
# ##############################
/bin/bash scripts/install_nvm.sh
nvm install node
/bin/bash scripts/install_nvim.sh

# ##############################
# Development
# ##############################
sudo apt install -y build-essential python-openssl python3-pip
/bin/bash script/install_python_development.sh
/bin/bash script/install_gitconfig.sh
