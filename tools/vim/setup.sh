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
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp vimrc ~/.vimrc

# running the vim installation from command line
vim +PluginInstall +qall
