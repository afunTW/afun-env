#!/usr/bin/bash

ZSH_DIR="$HOME/.zsh"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $CURRENT_DIR

# ##############################
# Install zsh
# ##############################
if [ ! -f "$HOME/.zshrc" ]; then
    sudo apt update
    sudo apt install -y zsh
    zsh --version
    chsh -s $(which zsh)
fi

# ##############################
# Install and setup zplug
# ##############################
if [ ! -d "$HOME/.zplug" ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    mv "$HOME/.zshrc" "$HOME/.zshrc.pre-zplug"
    cp "$CURRENT_DIR/zshrc" "$HOME/.zshrc"
fi

# ##############################
# Dependencies for zplug
# ##############################
DEVTOOL_DIR="$HOME/workspace/devtools/"
mkdir -p $DEVTOOL_DIR
git clone git://github.com/wting/autojump.git "$DEVTOOL_DIR/autojump"
python3 "$DEVTOOL_DIR/autojump/install.py"
