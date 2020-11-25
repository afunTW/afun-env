#!/usr/bin/bash

sudo apt update
sudo apt install -y git curl tree

./devtools/setup_clitools.sh
./devtools/setup_gitconfig.sh
./devtools/setup_zshrc.sh
