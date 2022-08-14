#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
NVIM_DIR="$HOME/.config/nvim"
NVIM_PLUGIN_DIR=$NVIM_DIR/plugins
mkdir -p $NVIM_DIR $NVIM_PLUGIN_DIR

# ##############################
# install nvim
# ##############################
# ref https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
sudo apt install -y \
    vim neovim python3-neovim software-properties-common \
    python3-dev python3-pip

# ##############################
# install vim-plug
# ##############################
# ref https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#if [ -d $NVIM_DIR ]; then
#    nvim --headless +PlugInstall +qall
#fi
