#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 && pwd)"
ZSH_RC="$HOME/.zshrc"
ZSH_ALIAS="$HOME/.zsh_alias"
_prompt="
PROJECT_DIR=$PROJECT_DIR
ZSH_RC=$ZSH_RC
"
echo $_prompt

# ##############################
# Install zsh
# ##############################
if [ "$(cat /etc/shells | grep zsh | wc -l)" = 0 ]; then
    echo "Install zsh..."
    sudo apt install -y zsh
fi
if [ $SHELL != $(which zsh) ]; then
    echo "Setting default shell to zsh..."
    sudo chsh -s $(which zsh)
fi

# ##############################
# Install zplug
# ##############################
if [ ! -d "$HOME/.zplug" ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# ##############################
# Update
# ##############################
cp $PROJECT_DIR/configs/zshrc $ZSH_RC
cp $PROJECT_DIR/configs/zsh_alias $ZSH_ALIAS
source $ZSH_RC
zplug install
zplug status
