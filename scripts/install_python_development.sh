#!/bin/bash

ZSH_RC="$HOME/.zshrc"

# ##############################
# Install pyenv
# ##############################
PYENV_DIR="$HOME/.pyenv"
if [ ! -d $PYENV_DIR ]; then
    git clone https://github.com/pyenv/pyenv.git $PYENV_DIR
    cd $PYENV_DIR && src/configure && make -C src
    echo '' >> $ZSH_RC
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc

    # pyenv dependencies
    sudo apt-get update
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi
