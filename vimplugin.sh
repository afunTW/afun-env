#!/bin/bash

# install the vundle, which is the vim plugin manager
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# setting the .vimrc
cat vimrcsetting >> ~/.vimrc
