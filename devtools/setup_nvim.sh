#!/usr/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# ##############################
# Neovim
# ##############################

# ref https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
sudo apt install neovim python3-neovim software-properties-common

# create the file structure
mkdir -p "$HOME/.config/nvim"
touch "$HOME/.config/nvim/init.vim"
pip3 install --user neovim

# ##############################
# Plugins
# ##############################
# get vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# clone the config file
if [ -d "$HOME/.config/nvim" ]; then
    cp -r "$CURRENT_DIR/nvim/." "$HOME/.config/nvim/."
    # install package by vim-plug
    nvim --headless +PlugInstall +qall
fi

# ##############################
# Python
# ##############################
DEVTOOL_DIR="$HOME/workspace/devtools/"
mkdir -p $DEVTOOL_DIR

# black, isort
pip3 instsall --user black, isort
