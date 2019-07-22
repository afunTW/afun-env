#!/bin/bash

DEPENDENCY=(git curl)
for i in "${DEPENDENCY[@]}"; do
    dpkg -s $i &> /dev/null
    # if package is not installed
    if [ $? -eq 1 ]; then
        echo "Package $i is NOT installed"
        sudo apt-get -y install "$i"
    fi
done

# install Vundlue to manage vim plugin
# you can check the plugin list at https://www.vim.org/scripts/
VUNDLE_PATH="$HOME/.vim/bundle/vundle"
if [ ! -d "$VUNDLE_PATH" ]; then
    git clone https://github.com/gmarik/vundle.git $VUNDLE_PATH
elif [ -z "$(ls -A $VUNDLE_PATH)" ]; then
    rmdir $VUNDLE_PATH
    git clone https://github.com/gmarik/vundle.git $VUNDLE_PATH
else
    echo "$VUNDLE_PATH exists and it's not empty"
fi
cp vimrc ~/.vimrc

# running the vim installation from command line
vim +PluginInstall +qall
