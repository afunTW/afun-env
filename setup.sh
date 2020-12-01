#!/usr/bin/bash

# ##############################
# System
# ##############################
sudo apt update
sudo apt install -y \
    git curl tree byobu powerline fonts-powerline \
    libbz2-dev

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
# Python
# ##############################
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
pipenv ipython3

curl https://pyenv.run | bash

# ##############################
# Devtools
# ##############################
./devtools/setup_alternative.sh
./devtools/setup_gitconfig.sh
./devtools/setup_zshrc.sh
./devtools/setup_nvim.sh
